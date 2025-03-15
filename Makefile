# Download the latest Jellyfin spec
.PHONY: download
download:
	curl -fsSl https://bangumi.github.io/api/dist.json -o Sources/bangumi-openapi.json

# Run CreateAPI
.PHONY: generate
generate:
	swift package --allow-writing-to-package-directory generate-api