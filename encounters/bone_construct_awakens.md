# Bone Construct Awakens

- combatants:
  - [Bone Construct](#Bone%20Construct): 1
- trigger:
  - location: [Garden](#Garden)
  - condition: touch_spring_rib
- xp: 700

> The [Bone Construct](#Bone%20Construct) hauls itself from the silt around the rib in the southeast of the [Garden](#Garden), water sluicing from its joints. It fights to the death; the party can break off the engagement only by leaving the spring's immediate vicinity.

#### Implementation notes

Wired in the entities: [Spring Water](#Spring%20Water)'s `On Touch` (touching
the rib wakes the [Bone Construct](#Bone%20Construct) — sets `awake` +
`hostile`, emits `BeginCombat`) and the construct's own `On Damage` (striking
it while dormant wakes it the same way). The engagement can be broken off by
leaving the Garden — encounters are room-bound, so the leash falls out free.
