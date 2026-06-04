.PHONY: lower clean

# Lower the Bone Garden FML tree to a Lua floor resource (LFR).
# Requires fml-parser: pip install "fml_parser @ git+https://github.com/TowerCrawlerAI/fml-parser@main"
# or locally:           pip install -e /path/to/fml-parser

lower: build/floor.lua

build/floor.lua: index.md
	@mkdir -p build
	python3 -m fml_parser lower index.md -o build/floor.lua
	@echo "Lowered floor.lua: $$(wc -l < build/floor.lua) lines"

clean:
	rm -f build/floor.lua
