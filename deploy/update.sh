#!/usr/bin/env bash
# Pull the fork, rebuild the image and restart Navidrome on the mini PC.
# Usage (as root on the mini PC): /opt/media/navidrome-src/deploy/update.sh [branch]
set -euo pipefail

cd "$(dirname "$0")/.."
branch="${1:-master}"

git fetch --tags origin
git checkout "$branch"
git pull --ff-only origin "$branch"

export GIT_SHA="$(git rev-parse --short HEAD)"
export GIT_TAG="$(git describe --tags --abbrev=0 2>/dev/null || echo fork)-matars"

mkdir -p /opt/media/navidrome/data
chown 1000:1000 /opt/media/navidrome/data

docker compose -f deploy/compose.yaml up -d --build
docker image prune -f >/dev/null
docker compose -f deploy/compose.yaml ps
