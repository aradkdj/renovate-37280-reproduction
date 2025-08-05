# 37280

Reproduction for [Renovate discussion 37280](https://github.com/renovatebot/renovate/discussions/37280).

## Current behavior

Renovate does not extract version information from docker images in `RUN` docker commands when they are not the first mount.

## Expected behavior

Renovate is able to extract version information from mounted images in `RUN` commands even when they are not the first mount.

### Docker digest pinning disabled

If image digest pinning is disabled, then Renovate updates the mounted image tag.

```dockerfile
RUN --mount=source=README.md,target=README.md --mount=from=ghcr.io/astral-sh/uv:0.8,source=/uv,target=/bin/uv \
    uv self version >> uv-version.txt
```

### Docker digest pinning enabled

If image digest pinning is disabled, then Renovate pins the mounted image tag.

```dockerfile
RUN --mount=source=README.md,target=README.md --mount=from=ghcr.io/astral-sh/uv:0.7@sha256:40775a79214294fb51d097c9117592f193bcfdfc634f4daa0e169ee965b10ef0,source=/uv,target=/bin/uv \
    uv self version >> uv-version.txt
```
