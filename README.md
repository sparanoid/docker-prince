# Docker Prince

Prince XML Docker image with ARM64/Apple silicon support based on official `aarch64-musl` binary.

- [ghcr.io](https://github.com/users/sparanoid/packages/container/package/prince)

## Usage

```fish
docker run --rm -it -v (pwd):/pdf ghcr.io/sparanoid/prince https://sparanoid.com/about/ -o /pdf/example.pdf

# Add custom font support
docker run --rm -it -v (pwd):/pdf -v (pwd)/fonts:/root/.fonts: ghcr.io/sparanoid/prince https://sparanoid.com/about/ -o /pdf/example.pdf
```

## License

Apache-2.0
