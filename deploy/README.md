# Running this fork

This is Matars' fork of [navidrome/navidrome](https://github.com/navidrome/navidrome).
It runs on the mini PC `sacraficial-mini-ms-b09012` (Ubuntu, on the tailnet).

| What | Where |
| --- | --- |
| Checkout of this fork | `/opt/media/navidrome-src` |
| Database, cache, `navidrome.toml` | `/opt/media/navidrome/data` |
| Music library (read-only) | `/home/sacraficial-mini/Music` |
| Local port | `127.0.0.1:4533` |
| Tailnet URL | `https://sacraficial-mini-ms-b09012.tail23efcc.ts.net` (Tailscale Serve) |

## Ship a change

1. Commit and push to this fork (`master`, or a branch).
2. On the mini PC, as root:

   ```bash
   /opt/media/navidrome-src/deploy/update.sh          # master
   /opt/media/navidrome-src/deploy/update.sh my-branch
   ```

   It pulls, rebuilds the image from source and restarts the container. Data is untouched.

## Take upstream releases

```bash
git fetch upstream --tags
git merge v0.65.0        # or upstream/master
git push origin master
```

## Logs

```bash
docker logs -f navidrome
```
