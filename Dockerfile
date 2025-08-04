FROM python:3.13-alpine

RUN --mount=from=ghcr.io/astral-sh/uv:0.7,source=/uv,target=/bin/uv \
    uv self version

COPY --from=ghcr.io/astral-sh/uv:0.7 /uvx /bin/uvx

CMD ["ls", "/bin"]