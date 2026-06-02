# The Hanged Corpse

- ac: 10
- hp: 1
- cr: 0
- type: undead
- disposition: cryptic, oracular
- senses: blindsight 60 ft
- languages: all (understands; speaks only when answering)

> An intact corpse hangs from a noose of its own braided hair at the eastern edge of the [Garden](#Garden), where the bone trees thin and the violet sky turns indigo. It has been here longer than the [Skull King](#Skull%20King). If asked the right question in the right way, it will answer.

#### Traits

##### Beyond Killing

- type: passive

> Damage dealt to the Hanged Corpse has no effect; it is already as dead as a thing can be. It does not initiate combat.

#### Triggers

###### InsteadOf Damaged

Block the damage

#### Actions

##### Answer

- uses: 1 per party
- check: dc18-insight OR dc18-persuasion
- effect: imparts skull_king_true_name
- hidden: On a successful Answer roll, the corpse imparts the [Skull King's true name](#The%20Sigil) — the same `skull_king_true_name` flag the Sigil teaches.

> Once per party, the Hanged Corpse will answer one truthful question if the asker rolls DC 18 Insight or Persuasion (or makes a sufficient roleplay case at DM discretion).
