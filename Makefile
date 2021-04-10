s3-bucket := https://plutus-cli.s3.amazonaws.com

define get-manifest-value
$(shell curl -s ${s3-bucket}/${1} | jq -r '.${2}')
endef

update: export PLUTUS_VERSION := $(call get-manifest-value,version,version)
update: export MACOS_SHA256 := $(call get-manifest-value,darwin-x64,sha256gz)
update: export LINUX_SHA256 := $(call get-manifest-value,linux-x64,sha256gz)
update:
	cat templates/plutus.tpl | envsubst > Formula/plutus.rb
