s3-bucket := https://plutus-cli.s3.amazonaws.com

define get-manifest-value
$(shell curl -s ${s3-bucket}/${1} | jq -r '.${2}')
endef

git-setup:
ifdef CI
	git config user.email accounts@better.com
	git config user.name "Better Robot"
endif

update-plutus: export PLUTUS_VERSION := $(call get-manifest-value,version,version)
update-plutus: export MACOS_GZ_SHA256 := $(call get-manifest-value,darwin-x64,sha256gz)
update-plutus: export LINUX_GZ_SHA256 := $(call get-manifest-value,linux-x64,sha256gz)
update-plutus: git-setup
	cat templates/plutus.tpl | envsubst > Formula/plutus.rb
	git commit -a -m 'auto update plutus ${PLUTUS_VERSION} [skip ci]' && git push origin HEAD:main || echo 'nothing to update'

update: update-plutus
