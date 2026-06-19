# Hall of Skulls

- exits:
  - south: [Entry](#Entry)
- map:
  - width: 29
  - height: 29
  - image: sample-dungeon/img/rooms/hall_of_skulls_background.jpg

> The Hall of Skulls itself is a low basilica of bone, lit by oil-lamps suspended in the eye-sockets of a chandelier-skull the size of a small house. At the far end, on a throne assembled from the spines of three different giants, sits the [Skull King](#Skull%20King). His court of [Skeleton Archers](#Skeleton%20Archer) occupies the gallery above the floor and shoots through arrow-slits worked into the wall behind his throne.

> His crown is the prize most contestants come for — a band of beaten gold and finger-bones — and there is no path to it that does not run through him or around the loyalty of his court.

#### Supporters

##### Throne

> The throne is made of the spines of three different giants, each vertebra the size of a dinner plate, stacked and lashed with tendon.

#### Triggers

###### On Enter

```luau
-- Throne Audience: entering the Hall springs the fight. The Skull King and his
-- archer are flagged `hostile`, so emitting BeginCombat lets the dnd5e layer
-- open an enemies-first initiative encounter (the engine materialises the
-- hostility edges to the player). Fires once.
if not wyrd.get_world("throne_audience_started") then
    wyrd.set_world("throne_audience_started", "true")
    wyrd.say("The Skull King stirs on his throne. A skeleton archer raises its bow from the gallery above. He regards you with empty eye sockets and speaks in a measured, resonant voice: \"Why have you come?\"")
    wyrd.emit(ctx.place or ctx.target, "BeginCombat", { actor = ctx.actor })
end
```
