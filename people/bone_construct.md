# Bone Construct

- kind: npc
- awake: false
- hostile: false
- at_location: garden
- init_bonus: -1
- attack_bonus: 7
- damage: "2d6+4"
- damage_type: bludgeoning
- attacks: 2
- resist_bludgeoning: true
- resist_piercing: true
- resist_slashing: true
- immune_poison: true
- immune_psychic: true
- ac: 15
- hp: 85
- cr: 4
- type: construct
- speed: 20 ft
- str: 18
- dex: 8
- con: 16
- int: 3
- wis: 8
- cha: 1
- senses: blindsight 30 ft, passive Perception 9
- damage_resistances: bludgeoning, piercing, slashing from nonmagical attacks
- damage_immunities: poison, psychic
- condition_immunities: charmed, exhaustion, frightened, paralyzed, petrified, poisoned
- aliases: [bone construct, construct, guardian]

> A half-buried thing of fused vertebrae and ribs, dormant beneath the spring in the southeast quadrant of the [Garden](#Garden) until the rib that channels the water is touched. Fights to the death; cannot be reasoned with.

#### Traits

##### Bound to the Spring

- type: passive

> The Bone Construct cannot move more than 30 ft. from the rib that wakes it. If forced beyond that range, it collapses to inert bones for 1 hour.

#### Implementation notes

- **Waking** — [Spring Water](#Spring%20Water)'s `On Touch` trigger: touching
  the rib sets `awake` + `hostile` and emits `BeginCombat` (the dnd5e
  enemies-first ambush). Striking the dormant construct directly also wakes it
  (the `On Damage` trigger below).
- **Bound to the Spring** — encounters are room-bound in the engine, so the
  leash falls out for free: leaving the Garden drops the fight and the
  construct never pursues. The 30-ft collapse rule and Bone Storm stay prose
  (elaborations, deferred like the Skull King's legendary actions).

#### Triggers

###### On Damage

```luau
-- A blow wakes the dormant guardian: it turns hostile and the ambush opens.
-- (Touching the rib is the usual wake path — see Spring Water's On Touch.)
local bc = ctx.target
if wyrd.get(bc, "awake") ~= true then
    wyrd.set(bc, "awake", true)
    wyrd.set(bc, "hostile", true)
    wyrd.say("The half-buried thing you struck is not a ruin. It is a sleeper. The construct heaves itself upright, silt cascading from its ribs.")
    local room = wyrd.neighbors(bc, "in", "out")[1]
    if room then wyrd.emit(room, "BeginCombat", { actor = ctx.actor }) end
end
```

#### Actions

##### Multiattack

> Two slam attacks.

##### Slam

- attack_bonus: 7
- damage: "2d6+4"
- damage_type: bludgeoning
- reach: 5

> Melee Weapon Attack, +7 to hit, reach 5 ft. Hit: 11 (2d6+4) bludgeoning damage.

##### Bone Storm (Recharge 5-6)

- recharge: "5-6"
- range: 10 ft radius
- save: dc14-dex
- damage: "4d6"
- damage_type: piercing
- half_on_save: true

> All creatures within 10 ft. make a DC 14 Dex save or take 14 (4d6) piercing damage from flying bone shards; half on success.
