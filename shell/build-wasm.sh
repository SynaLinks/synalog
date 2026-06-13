#!/usr/bin/env bash
set -euo pipefail

# Build the in-browser playground wasm module from src/wasm.rs and place the
# wasm-bindgen glue under docs/playground/pkg/ so the docs site (and the
# Documentation CI job) can serve it as a static asset.
#
# Prerequisites:
#   rustup target add wasm32-unknown-unknown
#   cargo install wasm-bindgen-cli --version 0.2.114   # must match Cargo.lock
#
# Optional (smaller wasm): install `wasm-opt` (binaryen); the script uses it when present.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

OUT="docs/playground/pkg"
PROFILE_DIR="target/wasm32-unknown-unknown/release"

echo "▶ compiling synalog -> wasm32 (--features wasm)"
cargo build --release --target wasm32-unknown-unknown \
  --no-default-features --features wasm

echo "▶ running wasm-bindgen -> $OUT"
rm -rf "$OUT"
wasm-bindgen "$PROFILE_DIR/synalog.wasm" \
  --out-dir "$OUT" --target web --no-typescript

if command -v wasm-opt >/dev/null 2>&1; then
  echo "▶ optimising with wasm-opt"
  wasm-opt -Oz "$OUT/synalog_bg.wasm" -o "$OUT/synalog_bg.wasm"
else
  echo "▷ wasm-opt not found; skipping size optimisation"
fi

echo "✓ playground wasm built:"
ls -lh "$OUT"
