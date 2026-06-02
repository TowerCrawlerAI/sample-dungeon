# Bone Garden Wandering

- table_name: bone_garden_wandering
- trigger:
  - location: [Garden](#Garden)
  - every: 3_rooms_explored
  - condition: party_makes_noise

> Drawn when the party explores the [Garden](#Garden) for an extended time or makes significant noise.

#### Entries

##### Skeleton Pack

- weight: 3
- combatants:
  - [Skeleton Scavenger](#Skeleton%20Scavenger): 3

> Three scavengers from the silt; no loot beyond their rusted weapons.

##### Archer Detachment

- weight: 2
- combatants:
  - [Skeleton Archer](#Skeleton%20Archer): 2
- side_effect: alert_throne

> Two archers drawn from the [Hall of Skulls](#Hall%20of%20Skulls) gallery. Alerting them; subsequent [Throne Audience](#Throne%20Audience) starts with two fewer archers.

##### Distant Sighting

- weight: 1
- type: non_combat

> A glimpse of [The Hanged Corpse](#The%20Hanged%20Corpse) in the distance — no combat, but the party gains the hint that something is at the eastern edge.
