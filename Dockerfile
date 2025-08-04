FROM python:3.13-alpine

RUN --mount=from=ghcr.io/astral-sh/uv:0.8@sha256:40775a79214294fb51d097c9117592f193bcfdfc634f4daa0e169ee965b10ef0,source=/uv,target=/bin/uv \
    uv self version

CMD ["ls", "/bin"]