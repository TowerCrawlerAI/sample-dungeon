# Gate Ambush

- combatants:
  - [Skeleton Scavenger](#Skeleton%20Scavenger): 4
- trigger:
  - location: [Entry](#Entry)
  - condition: lingered_or_loud
- xp: 200

> Things that move under the silt rise to take a lingering party at the [Entry](#Entry) gate. Open silt; no cover; difficult terrain for medium creatures. The scavengers emerge in a rough ring around the party and close.

#### Triggers

###### On Start

```luau
local self_id = _find_entity("gate_ambush")
if self_id then
    engine.set_property(self_id, "triggered", "true")
end
engine.output("The silt erupts. Four skeleton scavengers burst from beneath the surface in a ring around the party, grinding joints already reaching for you. There is no cover at this gate.")
```
