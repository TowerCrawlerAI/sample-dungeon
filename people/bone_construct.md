# Bone Construct

- awake: false
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

#### Triggers

###### Before Move

**If** distance from self to [Spring Rib](#Garden) is greater than 30:
  Apply inert to self
  Block the move
**End.**

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
