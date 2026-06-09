#!/usr/bin/env bash
# lower.sh — Lower the Bone Garden FML tree to build/floor.lua
#
# Usage: scripts/lower.sh [OUTPUT]
#   OUTPUT  optional path for the output file (default: build/floor.lua)
#
# Requires fml-parser to be installed:
#   pip install "fml_parser @ git+https://github.com/TowerCrawlerAI/clotho@main"
# or from a local checkout:
#   pip install -e /path/to/fml-parser

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT="${1:-"${REPO_ROOT}/build/floor.lua"}"

mkdir -p "$(dirname "$OUTPUT")"

echo "Lowering ${REPO_ROOT}/index.md -> ${OUTPUT}"
python3 -m fml_parser lower "${REPO_ROOT}/index.md" -o "${OUTPUT}"
echo "Done: $(wc -l < "${OUTPUT}") lines written to ${OUTPUT}"
