.PHONY: lower clean

# Lower the Bone Garden FML tree to a Lua floor resource (LFR).
# Requires fml-parser: pip install "fml_parser @ git+https://github.com/TowerCrawlerAI/clotho@main"
# or locally:           pip install -e /path/to/fml-parser

lower: build/floor.lua

build/floor.lua: index.md
	@mkdir -p build
	# --om: the object-model (Wyrd) LFR the engine's runtime path loads
	# (wyrd.* binding surface + wyrd.on reaction triggers). This is the form
	# play-wyrd.sh / the acceptance harness / the engine consume.
	# --map: also emit build/map.json, the VTT sidecar (MAP_FORMAT.md) carrying
	# room layout + the presentation-only `map:`/`token:` overrides. Written
	# beside the -o file; stripped from the LFR so the engine never sees it.
	python3 -m fml_parser lower index.md --om --map -o build/floor.lua
	@echo "Lowered floor.lua: $$(wc -l < build/floor.lua) lines; map.json: $$(wc -c < build/map.json) bytes"

clean:
	rm -f build/floor.lua build/map.json
