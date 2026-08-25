s3-bucket := https://plutus-cli.s3.amazonaws.com

_darwin-manifest := $(shell curl -s $(s3-bucket)/channels/stable/plutus-darwin-arm64-buildmanifest)
_linux-manifest  := $(shell curl -s $(s3-bucket)/channels/stable/plutus-linux-x64-buildmanifest)

git-setup:
ifdef CI
	git config user.email accounts@better.com
	git config user.name "Better Robot"
endif

update-plutus: export PLUTUS_VERSION  := $(shell echo '$(_darwin-manifest)' | jq -r '.version')
update-plutus: export MACOS_GZ_URL    := $(shell echo '$(_darwin-manifest)' | jq -r '.gz')
update-plutus: export MACOS_GZ_SHA256 := $(shell echo '$(_darwin-manifest)' | jq -r '.sha256gz')
update-plutus: export LINUX_GZ_URL    := $(shell echo '$(_linux-manifest)' | jq -r '.gz')
update-plutus: export LINUX_GZ_SHA256 := $(shell echo '$(_linux-manifest)' | jq -r '.sha256gz')
update-plutus: git-setup
	cat templates/plutus.tpl | envsubst > Formula/plutus.rb
	git commit -a -m 'auto update plutus ${PLUTUS_VERSION} [skip ci]' && git push origin HEAD:main || echo 'nothing to update'

update: update-plutus
