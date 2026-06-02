# Bone Construct Awakens

- combatants:
  - [Bone Construct](#Bone%20Construct): 1
- trigger:
  - location: [Garden](#Garden)
  - condition: touch_spring_rib
- xp: 700

> The [Bone Construct](#Bone%20Construct) hauls itself from the silt around the rib in the southeast of the [Garden](#Garden), water sluicing from its joints. It fights to the death; the party can break off the engagement only by leaving the spring's immediate vicinity.

#### Triggers

###### On Start

```luau
local self_id = _find_entity("bone_construct_awakens")
if self_id then
    engine.set_property(self_id, "triggered", "true")
end
engine.output("The great rib in the silt shudders. The Bone Construct hauls itself free of the earth, water streaming from its joints, and turns toward you.")
```
