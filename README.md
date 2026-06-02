# sample-dungeon

The **Bone Garden** — TowerCrawlerAI's canonical test floor. A modular FML tree authored to exercise every system capability the engine claims to support: every verb, every container mechanic, every visibility state, every conditional, every kind, every scope mode, every two-noun grammar form.

## Layout

- `index.md` — the floor entry point (H1 floor title + imports + start_location)
- `rooms/` — 14 rooms including the Hall of Skulls (boss room), the Twisting Tunnels Konami puzzle, the Crypt + Sarcophagus container chain
- `people/` — NPCs including the Skull King boss
- `items/` — props, weapons, consumables, documents
- `encounters/` — scripted encounter triggers
- `quests/` — quest definitions (Claim the Crown, The Hidden Name)
- `wandering/` — wandering-monster spawn tables

## v0.1 acceptance gate

Defeat the Skull King via one of three paths:

1. **Sword path:** retrieve the Bone-Hilted Sword from the sarcophagus in the Crypt (via Twisting Tunnels Konami sequence), return to the Hall of Skulls, `hit skull king with sword`.
2. **Sigil path:** retrieve the Sigil from the Ossuary, navigate to the Hall of Skulls, `throw sigil at skull king`.
3. **Riddle path:** `ask skull king about riddle` to get the topic response, parse the riddle, `answer <correct>`.

## Dependencies

Sample-dungeon imports the `stdlib` repo's FML for verb rules + kind definitions. Lower via `fml-parser`. Load lowered LFR via `engine-core`'s `crawler-engine` binary.

## Companion repos

Under `TowerCrawlerAI/`:
- [`engine-core`](../engine-core) — C engine + Luau VM
- [`stdlib`](../stdlib) — FML verb/kind catalog
- [`fml-parser`](../fml-parser) — FML → LFR emitter
- [`wiki`](../wiki) — design docs + FML spec

## The principle

Every system capability the engine ships must have an exemplar here. New feature → new Bone Garden entity that exercises it. If a capability isn't demonstrated end-to-end in the Bone Garden, the system has no human-testable evidence it works.

## Status

Carried over from the TowerAI monorepo split on 2026-06-02.
