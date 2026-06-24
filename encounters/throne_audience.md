# Throne Audience

- combatants:
  - [Skull King](#Skull%20King): 1
  - [Skeleton Archer](#Skeleton%20Archer): 1
- trigger:
  - location: [Hall of Skulls](#Hall%20of%20Skulls)
  - condition: enter
- xp: 1200
- hidden: If the party speaks the Skull King's true name aloud (acquired from [The Sigil](#The%20Sigil) or [The Hanged Corpse](#The%20Hanged%20Corpse)) at any point in this encounter, he is *stunned* for one round (no save) and his archers lose their reaction for that round. Apply the `name_spoken` modifier.

> The [Skull King](#Skull%20King) on his throne; a [Skeleton Archer](#Skeleton%20Archer) in the gallery with three-quarters cover; the chandelier-skull casts dim light around the room edges and bright light at the center. The Skull King opens with a courteous greeting and a single question — "Why have you come?" — and waits one round for an answer before initiative is rolled.

#### Implementation notes

This encounter is wired in the entities themselves, not here:

- **Solo balance pass** — the Bone Garden is played solo (one dynamically-spawned
  protagonist), so the Hall is tuned for a single adventurer rather than a party
  of four: a lone gallery archer (not four), and the Skull King makes a single
  greatsword attack a round (`attacks: 1`, not the party-scaled multiattack) so
  his opening turn can't delete a fresh character before they act. He keeps his
  AC 20 / 180 hp / Undead Fortitude boss identity — the solo win is a *victory
  path* (the bone-hilted sword, the hurled Sigil, or simply answering the riddle
  — "skull"), not a raw-damage race.

- **The ambush** — [Hall of Skulls](#Hall%20of%20Skulls) `On Enter` announces the
  audience and emits `BeginCombat` (once, gated by the
  `throne_audience_started` world flag); the dnd5e layer opens the
  enemies-first initiative encounter from the `hostile` flags on the King and
  the archer.
- **The true name** — the [Skull King](#Skull%20King) `On Answer` trigger: speaking
  ALDRIC (once, and only if `skull_king_true_name` has been learned) stuns him
  for one round (no save) and frightens the gallery archer for the round — the
  engine has no reaction economy, so "loses its reaction" lowers to the
  mildest real debuff. Sets `name_spoken` so the spoken name is spent.
