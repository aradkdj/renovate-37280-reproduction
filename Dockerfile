FROM debian:bookworm-slim@sha256:2424c1850714a4d94666ec928e24d86de958646737b1d113f5b2207be44d37d8

RUN --mount=source=README.md,target=README.md --mount=from=ghcr.io/astral-sh/uv:0.7,source=/uv,target=/bin/uv \
    uv self version >> uv-version.txt

CMD ["cat", "uv-version.txt"]