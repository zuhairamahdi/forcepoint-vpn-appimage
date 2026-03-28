# Forcepoint VPN CLI AppImage

This repository contains a **self-contained AppImage** for the Forcepoint VPN CLI client (`forcepoint-client`).
It bundles all required libraries (`libevent`, `OpenSSL 1.1`, etc.) and works on most modern Linux distributions including Arch, Fedora, and Ubuntu derivatives.

> ⚠️ This is a **CLI-only** VPN client. There is no GUI.

---

## Features

* Fully self-contained AppImage, no installation required
* Works without sudo (unless your VPN configuration requires it)
* Configurable via `~/.config/forcepoint/fp.conf`
* Supports manual and automatic connection modes

---

## Getting Started

### Download the AppImage

Go to the [Releases](https://github.com/zuhairamahdi/forcepoint-vpn-appimage/releases) tab and download the latest:

```bash
Forcepoint_VPN_CLI-x86_64.AppImage
```

### Make it executable

```bash
chmod +x Forcepoint_VPN_CLI-x86_64.AppImage
```

### Run the VPN

**Manual mode (specify gateway and username):**

```bash
./Forcepoint_VPN_CLI-x86_64.AppImage <VPN_GATEWAY> -u <USERNAME>
```

Example:

```bash
./Forcepoint_VPN_CLI-x86_64.AppImage myhost.com -u your.username@company.com
```

**Automatic mode (read from config):**

Create a config file at `~/.config/forcepoint/fp.conf`:

```bash
VPN_GATEWAY="myhost.com" # or use the IP
USERNAME="your.username@company.com"
PASSWORD="your_password"       # or use PASSCMD for a command returning the password
RESOLVER="8.8.8.8"
CONFIG=""
```

Then run:

```bash
./Forcepoint_VPN_CLI-x86_64.AppImage
```

---

## Create Shell Aliases

You can make it easier to run the VPN by creating shell aliases:

**Bash or Zsh:**

```bash
# Add to ~/.bashrc or ~/.zshrc
alias forcepointvpn='~/path/to/Forcepoint_VPN_CLI-x86_64.AppImage'
```

Then reload your shell:

```bash
source ~/.bashrc   # or source ~/.zshrc
```

**Fish shell:**

```fish
# Add to ~/.config/fish/config.fish
alias forcepointvpn '~/path/to/Forcepoint_VPN_CLI-x86_64.AppImage'
```

Reload fish configuration:

```fish
source ~/.config/fish/config.fish
```

After that, you can run the VPN simply with:

```bash
forcepointvpn <VPN_GATEWAY> -u <USERNAME>
```

---

## Notes

* If your system mounts `/tmp` as `noexec`, the AppImage **automatically extracts to a safe directory**. No extra environment variables are needed.
* The included `_forcepoint-client` binary uses **bundled SSL/libevent libraries** for compatibility.
* CLI arguments override config file settings.

---

## Development / Rebuild

To rebuild the AppImage:

```bash
git clone https://github.com/<your-username>/forcepoint-vpn-appimage.git
cd forcepoint-vpn-appimage
chmod +x build.sh
./build.sh
```

This will generate a new `Forcepoint_VPN_CLI-x86_64.AppImage`.

---

## License

The Forcepoint VPN client is **proprietary software**. This repository only contains a wrapper and packaging scripts.
All rights for the VPN client itself remain with **Forcepoint**.

---

## Acknowledgements

* [AppImage](https://appimage.org/) for the packaging framework
* Original Forcepoint VPN Linux client (`forcepoint-client`)
