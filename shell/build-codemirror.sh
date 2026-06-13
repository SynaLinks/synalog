#!/usr/bin/env bash
set -euo pipefail

# Bundle CodeMirror 6 into a single self-hosted ESM for the playground editor:
#   docs/playground/vendor/codemirror.js
#
# Why a bundle (and not per-package CDN imports): CodeMirror's extension system
# uses instanceof on @codemirror/state values, so every package MUST share one
# copy of @codemirror/state. Importing the component packages individually from
# a CDN reliably loads multiple copies and breaks with
# "Unrecognized extension value ... multiple instances of @codemirror/state".
# One esbuild bundle guarantees a single instance — and works offline.
#
# The output is committed to the repo (it is a small, pinned asset), so the docs
# CI needs no Node. Re-run this script to refresh it after bumping versions.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD=".cm-build"
OUT="docs/playground/vendor/codemirror.js"
mkdir -p "$BUILD" "$(dirname "$OUT")"

cat > "$BUILD/package.json" <<'JSON'
{ "name": "cm-build", "private": true, "type": "module" }
JSON

cat > "$BUILD/entry.mjs" <<'JS'
// Single entry bundled by esbuild -> one shared @codemirror/state instance.
export { EditorState } from "@codemirror/state";
export {
  EditorView, lineNumbers, highlightActiveLineGutter, highlightActiveLine,
  drawSelection, keymap,
} from "@codemirror/view";
export {
  StreamLanguage, HighlightStyle, syntaxHighlighting, defaultHighlightStyle,
  indentOnInput, bracketMatching, foldGutter,
} from "@codemirror/language";
export { defaultKeymap, history, historyKeymap, indentWithTab } from "@codemirror/commands";
export { tags } from "@lezer/highlight";
export { sql } from "@codemirror/lang-sql";
JS

( cd "$BUILD" && npm install --no-audit --no-fund --silent \
    @codemirror/state@^6 @codemirror/view@^6 @codemirror/language@^6 \
    @codemirror/commands@^6 @codemirror/lang-sql@^6 @lezer/highlight@^1 esbuild )

"$BUILD/node_modules/.bin/esbuild" "$BUILD/entry.mjs" \
  --bundle --format=esm --minify --target=es2020 --legal-comments=none \
  --outfile="$OUT"

echo "✓ built $OUT ($(du -h "$OUT" | cut -f1))"
