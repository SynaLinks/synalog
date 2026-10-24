#!/usr/bin/env bash
set -euo pipefail

# ── Install Verus ────────────────────────────────────────
#
# Installs the Verus release that checks the proofs of `verified/`
# (`cargo verus verify`, run by `cargo test --test verus_proofs`), and the
# Rust toolchain that release requires. Usage:
#   shell/install-verus.sh            installs into ~/.verus
#   VERUS_DIR=/opt/verus shell/install-verus.sh
# then puts the release on the PATH (the script prints the line).
#
# The release goes with `vstd` in verified/Cargo.toml: bump them together.

RELEASE="0.2026.10.18.7d82994"
TOOLCHAIN="1.99.1"
VERUS_DIR="${VERUS_DIR:-$HOME/.verus}"

case "$(uname -s)-$(uname -m)" in
    Linux-x86_64) PLATFORM="x86-linux"; DIR="verus-x86-linux" ;;
    Darwin-arm64) PLATFORM="arm64-macos"; DIR="verus-arm64-macos" ;;
    Darwin-x86_64) PLATFORM="x86-macos"; DIR="verus-x86-macos" ;;
    *) echo "No Verus release for $(uname -s) $(uname -m)" >&2; exit 1 ;;
esac

mkdir -p "$VERUS_DIR"
ARCHIVE="$(mktemp -d)/verus.zip"
curl -fsSL -o "$ARCHIVE" \
    "https://github.com/verus-lang/verus/releases/download/release%2F${RELEASE}/verus-${RELEASE}-${PLATFORM}.zip"
rm -rf "${VERUS_DIR:?}/$DIR"
unzip -q -o "$ARCHIVE" -d "$VERUS_DIR"
rm -f "$ARCHIVE"
rustup toolchain install --profile minimal "$TOOLCHAIN"

"$VERUS_DIR/$DIR/verus" --version
echo "export PATH=\"$VERUS_DIR/$DIR:\$PATH\""
