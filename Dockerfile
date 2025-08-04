FROM debian:bookworm-slim

RUN --mount=source=README.md,target=README.md --mount=from=ghcr.io/astral-sh/uv:0.7,source=/uv,target=/bin/uv \
    uv self version >> uv-version.txt

CMD ["cat", "uv-version.txt"]