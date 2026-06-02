# Garden

- exits:
  - north: [Entry](#Entry)
- adjudicator: The Garden is one logical room in the sim, but contains three distinct points of interest — the southeast spring ([Bone Construct](#Bone%20Construct) + [Spring Water](#Spring%20Water)), the eastern edge ([The Hanged Corpse](#The%20Hanged%20Corpse)), and the open silt itself (wandering encounters). Parties can engage any subset; none is required.

> The Garden proper — the flat silt expanse and bone forest that the [Entry](#Entry) gate opens into. Beyond the floor's two main destinations, the Garden is alive with smaller dangers and small mercies.

> In the **southeast quadrant**, a hollow rib channels a spring of cold, sweet water — see [Spring Water](#Spring%20Water). Touching the rib wakes the [Bone Construct](#Bone%20Construct) and triggers [Bone Construct Awakens](#Bone%20Construct%20Awakens).

> At the **eastern edge**, where the bone trees thin and the violet sky turns indigo, [The Hanged Corpse](#The%20Hanged%20Corpse) hangs from a noose of its own braided hair. The silt is undisturbed there; nothing has come close in a long time.

> Wandering encounters in the Garden are drawn from the [Bone Garden Wandering](#Bone%20Garden%20Wandering) table.

#### Supporters

##### Spring Rib

- aliases: [rib, hollow rib, spring rib]
- fillable_source: true
- contents: spring_water

> A massive curved rib half-buried in the silt, hollow at its peak. Spring water rises from inside it. The water is cold and shockingly clear against the grey silt. If you had something to carry it in, you could take a measure of it with you.

#### Triggers

###### On Touch

```luau
-- Only react when the noun is the spring rib.
if ctx.noun == nil or ctx.noun.id ~= "spring_rib" then
    return -- nil: let caller show default output
end

-- Find the Bone Construct by scanning entities in global scope.
local bc_id = nil
local all_ids = engine.entities_in_scope("global", ctx.room.entity_id)
for _, eid in ipairs(all_ids) do
    local ent = engine.query_entity(eid)
    if ent ~= nil and ent.id == "bone_construct" then
        bc_id = eid
        break
    end
end

if bc_id == nil then
    -- Construct not registered — fall through to default touch output.
    return -- nil: let caller show default output
end

-- Idempotency guard: already awake.
local bc = engine.query_entity(bc_id)
if bc ~= nil and bc.awake == "true" then
    engine.output("The rib is silent. The water still runs cold.")
    return true -- handled: suppress default output
end

-- Awaken the construct: place it in the room and mark it awake.
engine.set_property(bc_id, "awake", "true")
engine.move_actor(bc_id, ctx.room.entity_id)
engine.output("The rib trembles. Bone scrapes on bone. The construct hauls itself from the silt around the spring, water sluicing from its joints. Eye-pits glow a dull, deep red.")
engine.fire_event("Awakens", bc_id)
return true -- handled: suppress default output
```
