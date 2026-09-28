#!/bin/sh
set -e

# Check for root
if [ "$(id -u)" != "0" ]; then
    echo "[-] cpx must be run with root"
    exit 1
fi

ACTION="$1"
PKG="$2"

case "$ACTION" in
    install)
        echo "[+] Package: $PKG"

        FOUND=0

        while IFS= read -r REPO; do
            [ -z "$REPO" ] && continue

            case "$REPO" in '#'*)
                continue
                ;;
            esac

            echo "[*] Checking repository: $REPO"

            if wget -q -O "/tmp/$PKG.cpx" "$REPO/$PKG.cpx"; then
                echo "[+] Found $PKG: $REPO"
                FOUND=1
                break
            fi
        done < /etc/cpx/repos.conf

        if [ "$FOUND" = "0" ]; then
            echo "[-] Package does not exist: $PKG"
            exit 1
        fi

        echo "[*] Loading $PKG.cpx..."
        . "/tmp/$PKG.cpx"

        mkdir -p "/tmp/$package"

        cd "/tmp/$package"

        echo "[*] Downloading $package..."
        wget -q -O "$package.$type" "$source"

        echo "[*] Extracting $package..."
        tar -xf "$package.$type"

        echo "[*] Preparing $package..."
        eval "$prepare"

        echo "[*] Configuring $package..."
        eval "$configure"

        echo "[*] Building $package..."
        eval "$build"

        echo "[*] Installing $package..."
        eval "$install"

        echo "[+] Successfully installed $package"
        ;;

    search)
        echo "[*] Searching for package: $PKG"

        FOUND=0

        while IFS= read -r REPO; do
            [ -z "$REPO" ] && continue

            case "$REPO" in '#'*)
                continue
                ;;
            esac

            if wget -q --spider "$REPO/$PKG.cpx"; then
                echo "[+] Found $PKG: $REPO"
                FOUND=1
            fi
        done < /etc/cpx/repos.conf

        if [ "$FOUND" = "0" ]; then
            echo "[-] Package does not exist: $PKG"
            exit 1
        fi
        ;;

    *)
        echo "[-] Unknown action: $ACTION"
        echo "[+] Usage: cpx <install|remove|search> <package>"
        ;;
esac
