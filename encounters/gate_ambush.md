# Gate Ambush

- combatants:
  - [Skeleton Scavenger](#Skeleton%20Scavenger): 4
- trigger:
  - location: [Entry](#Entry)
  - condition: lingered_or_loud
- xp: 200

> Things that move under the silt rise to take a lingering party at the [Entry](#Entry) gate. Open silt; no cover; difficult terrain for medium creatures. The scavengers emerge in a rough ring around the party and close.

#### Implementation notes

Wired in [Entry](#Entry)'s `On Enter` trigger: a visit counter (`entry_visits`
world flag) stands in for "lingered or loud" — the 5th visit to the gate
springs the ambush, once (`gate_ambush_started`). The pack (3 scavengers, the
wandering-table band) is spawned at ambush time from the `monster` prototype
with the [Skeleton Scavenger](#Skeleton%20Scavenger) stat block, then the
trigger emits `BeginCombat` for the dnd5e enemies-first encounter.
