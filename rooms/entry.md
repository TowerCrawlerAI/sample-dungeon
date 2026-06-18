# Entry

- exits:
  - north: [Towards Castle](#Hall%20of%20Skulls)
  - west: [Towards Tower](#Ossuary)
  - south: [Follow Canyon](#Garden)
- outdoor: true
- luminosity: 10
- hidden: DC 12 Perception detects the things beneath the silt. Parties that linger or argue loudly for more than 10 in-fiction minutes trigger the [Gate Ambush](#Gate%20Ambush).
- map:
  - width: 6
  - height: 6
  - image: sample-dungeon/img/rooms/entry_background.jpg

> The entrance to the Garden proper is a gate of welded vertebrae, each disc the size of a shield, and beyond it the path forks. To the [north](#Hall%20of%20Skulls), the silt is trampled into a road by something heavy and recent; the road climbs toward the [Hall of Skulls](#Hall%20of%20Skulls). To the [west](#Ossuary), the bone trees grow thicker, and between them a half-buried doorway hints at an older site: the [Ossuary](#Ossuary), reputed to be where the best treasures still lie undisturbed by the current sovereign's tax-collectors.

> Many parties have argued, over the threshold, about which way to go first; one or two have argued long enough to be picked off where they stood by the things that move under the silt.

#### Features

##### Gate

- kind: scenery

> The entrance to the Garden proper: a gate of welded vertebrae, each disc the size of a shield.

#### Triggers

###### On Enter

```luau
-- Gate Ambush: "lingered or loud" lowers to the Nth visit — a party that keeps
-- milling about the gate draws the things beneath the silt. One-shot. The
-- threshold (5) sits safely above any victory walkthrough (max 4 Entry visits).
-- The scavenger pack (3 — the wandering-table band; stat block:
-- people/skeleton_scavenger.md) is spawned here at ambush time: lowering
-- creates one node per entity, so the pack is cloned from the monster
-- prototype rather than pre-seeded.
local room = ctx.place or ctx.target
local visits = (tonumber(wyrd.get_world("entry_visits") or "0") or 0) + 1
wyrd.set_world("entry_visits", tostring(visits))
if visits >= 5 and not wyrd.get_world("gate_ambush_started") then
    wyrd.set_world("gate_ambush_started", "true")
    local proto = wyrd.named("Skeleton Scavenger")
    for _ = 1, 3 do
        local s = wyrd.create(proto)
        wyrd.set(s, "hostile", true)
        wyrd.relate("in", s, room)
    end
    wyrd.say("The silt erupts. Skeleton scavengers burst from beneath the surface in a ring around you, grinding joints already reaching. There is no cover at this gate.")
    wyrd.emit(room, "BeginCombat", { actor = ctx.actor })
end
```
