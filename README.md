# Docker Prince

Prince XML Docker image with ARM64/Apple silicon support based on official `aarch64-musl` binary.

- [Docker Hub](https://hub.docker.com/r/sparanoid/prince)
- [ghcr.io](https://github.com/users/sparanoid/packages/container/package/prince)

## Usage

```fish
docker run --rm -it -v (pwd):/pdf sparanoid/prince https://sparanoid.com/about/ -o /pdf/example.pdf
```

## License

Apache-2.0
