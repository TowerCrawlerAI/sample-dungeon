# Throne Audience

- combatants:
  - [Skull King](#Skull%20King): 1
  - [Skeleton Archer](#Skeleton%20Archer): 4
- trigger:
  - location: [Hall of Skulls](#Hall%20of%20Skulls)
  - condition: enter
- xp: 1200
- hidden: If the party speaks the Skull King's true name aloud (acquired from [The Sigil](#The%20Sigil) or [The Hanged Corpse](#The%20Hanged%20Corpse)) at any point in this encounter, he is *stunned* for one round (no save) and his archers lose their reaction for that round. Apply the `name_spoken` modifier.

> The [Skull King](#Skull%20King) on his throne; four [Skeleton Archers](#Skeleton%20Archer) in the gallery with three-quarters cover; the chandelier-skull casts dim light around the room edges and bright light at the center. The Skull King opens with a courteous greeting and a single question — "Why have you come?" — and waits one round for an answer before initiative is rolled.

#### Triggers

###### On Start

```luau
local self_id = _find_entity("throne_audience")
if self_id then
    engine.set_property(self_id, "triggered", "true")
end
engine.output("The Skull King stirs on his throne. Four skeleton archers raise their bows from the gallery above. He regards you with empty eye sockets and speaks in a measured, resonant voice: \"Why have you come?\"")
```

###### On RoundStart

- when: flag(skull_king_true_name) and not flag(name_spoken)

**If** party declares speak_name:
  Set [name_spoken](flag:name_spoken)
  Clear [skull_king_true_name](flag:skull_king_true_name)
  Apply stunned for 1 round to [Skull King](#Skull%20King)
  **Loop through** skeleton_archers in throne_audience:
    Clear reactions from current for this round
  **End.**
**End.**
