# sample-dungeon — CLAUDE.md

**"The Bone Garden"** — the canonical **v0.1 acceptance floor**, authored in FML markdown. Part of the
TowerCrawlerAI workspace; see the root `CLAUDE.md` for the multi-repo map + pipeline.

## What it is

A complete, playable floor (Tower floor 3) that exercises the engine's exploration surface. `index.md` is
the entry point; it **imports `stdlib`** for kinds/verbs/relations. Content lives in `rooms/`, `people/`,
`items/`, `encounters/`, `quests/`, `wandering/`.

Three victory paths (it's the fixture that proves the engine works end-to-end):
1. retrieve the Bone-Hilted Sword → defeat the Skull King;
2. retrieve the Sigil → throw it at the Skull King;
3. ask the Skull King his riddle → answer correctly.

## How it's used (lowering)

The engine loads a *lowered* LFR, not the markdown:

```bash
pip install -e ../clotho
make lower            # → build/floor.lua  (python -m fml_parser lower index.md)
# run it once the engine + stdlib are assembled:
#   wyrd build/floor.lua --stdlib <stdlib.lua>   (then feed JSONL on stdin)
```

CI (`.github/workflows/lower.yml`) lowers + uploads `floor.lua` as an artifact; wyrd's assembly
bundles it with the `wyrd` binary + the lowered stdlib into the runnable test program.

## Its role in v0.1

This is *the* acceptance fixture: **D2** verifies the Bone Garden lowers cleanly and plays on the v0.1
engine + core stdlib (exploration verbs, multi-actor directed output, deterministic skein). Keep it
exercising the v0.1 surface; v0.2-only (combat) paths should be marked, not relied on, until v0.2.

## Editing

Depends on `stdlib` (don't reference kinds/verbs it doesn't define). Normal git repo, base `main`.
Branch → PR → merge. Never commit `.claude/`. Re-run `make lower` after edits (exit 0).
