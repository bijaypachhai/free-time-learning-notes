# System Update on Arch Linux

### signature from "Daniel Bermond <dbermond@archlinux.org>" is marginal trust

```bash
pacman-key --init
pacman-key --populate archlinux
pacman -Sy archlinux-keyring

## if still the issue persists
## sign the key locally
pacman-key --lsign-key dbermond@archlinux.org
```
