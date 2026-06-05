# The Hanged Corpse

- ac: 10
- hp: 1
- cr: 0
- type: undead
- at_location: garden
- portable: false
- disposition: cryptic, oracular
- senses: blindsight 60 ft
- languages: all (understands; speaks only when answering)
- awaiting_answer: silence, the silence, quiet, stillness

> An intact corpse hangs from a noose of its own braided hair at the eastern edge of the [Garden](#Garden), where the bone trees thin and the violet sky turns indigo. It has been here longer than the [Skull King](#Skull%20King). If asked the right question in the right way, it will answer.

> Its jaw creaks open of its own accord, and a voice like dry leaves frames a riddle: *"I am what the Garden keeps and the dead still spend. Name me, and I will name the King."* You sense you are meant to **answer**.

#### Traits

##### Beyond Killing

- type: passive

> Damage dealt to the Hanged Corpse has no effect; it is already as dead as a thing can be. It does not initiate combat.

#### Triggers

###### InsteadOf Damaged

Block the damage

###### On Answer

```luau
-- Fired by the `answer` verb when the player speaks the riddle's answer. The
-- corpse imparts the Skull King's true name (the same flag the Sigil teaches).
engine.output("The corpse's jaw works without breath: 'Yesss. That is the shape of it.' It exhales a single word you somehow know for a name — ALDRIC — and the noose creaks as the body finally stills. You have learned the Skull King's true name.")
engine.set_world("skull_king_true_name", "true")
return true
```

#### Actions

##### Answer

- uses: 1 per party
- check: dc18-insight OR dc18-persuasion
- effect: imparts skull_king_true_name
- hidden: On a successful Answer, the corpse imparts the [Skull King's true name](#The%20Sigil) — the same `skull_king_true_name` flag the Sigil teaches.

> Once per party, the Hanged Corpse will answer one truthful question if the asker speaks the riddle's answer (DC 18 Insight or Persuasion at the table; on the engine, the `answer` verb matches the spoken phrase against the corpse's `awaiting_answer`).
