# Spring Water

- kind: liquid
- at_location: garden
- aliases: [water, spring, spring water, rib, spring rib]
- portable: false
- drinkable: true
- fillable_source: true
- charges: 1
- effect: protection_from_frightened
- duration: 1 hour

> Cold, sweet water that rises from a hollow rib in the southeast quadrant of the [Garden](#Garden). Drinking it grants one hour of protection against the *frightened* condition — either by filling a vessel you carry and drinking later, or by kneeling at the rib itself. Jealously guarded by a [Bone Construct](#Bone%20Construct) until the construct is destroyed.

#### Triggers

###### On Touch

```luau
-- Touching the rib wakes the Bone Construct (the Bone Construct Awakens
-- encounter): the dormant guardian in this room turns hostile and the dnd5e
-- layer opens an enemies-first ambush. Idempotent — a woken (or destroyed)
-- construct stays woken.
local rib = ctx.target
local room = wyrd.neighbors(rib, "in", "out")[1]
if room == nil then return end
local bc = nil
for _, id in ipairs(wyrd.neighbors(room, "in", "in")) do
    if string.find(string.lower(wyrd.get(id, "name") or ""), "construct") then
        bc = id
        break
    end
end
if bc == nil then return end
if wyrd.get(bc, "awake") == true then
    wyrd.say("The rib is silent. The water still runs cold.")
    return
end
wyrd.set(bc, "awake", true)
wyrd.set(bc, "hostile", true)
wyrd.say("The great rib shudders. Bone scrapes on bone. The construct hauls itself free of the silt, water sluicing from its joints, and turns toward you — eye-pits glowing a dull, deep red.")
wyrd.emit(room, "BeginCombat", { actor = ctx.actor })
```
