# Glass Case

- kind: container
- at_location: hall_of_skulls
- portable: false
- open: false
- transparent: true
- aliases: [glass case, display case, glass display case, vitrine, case]

> A rectangular case of thick green glass set in a wrought-iron frame,
> standing waist-high near the base of the Skull King's throne. Inside,
> on a velvet cushion, rests a single finger-bone ring — spoils from some
> earlier challenger who almost made it. The glass is sturdy but not
> invulnerable.

#### Items Inside

##### Finger Bone Ring

- kind: item
- at_location: glass_case
- portable: true
- takeable: true
- aliases: [finger bone ring, ring, bone ring, challenger's ring, spoils]

> A plain ring of polished human finger-bone. Whoever wore this last did
> not walk out of the Hall of Skulls.

#### Triggers

###### Before Attack

```luau
-- Reach-path interception (om): the case sits between the attacker and the ring
-- inside it. Attacking through a closed case shatters the case instead — the
-- attack is absorbed (veto), and the case is left broken + open so the contents
-- can then be taken. ctx.self is the case. (Fires once `attack` exists — v0.2.)
if not om.get(ctx.self, "open") then
    engine.set_prop(ctx.self, "broken", true)
    engine.set_prop(ctx.self, "open", true)
    ctx:veto("The glass shatters; the contents tumble free.")
end
```

###### Before Take

```luau
-- Block taking the ring while the case is sealed (not open and not broken).
if not om.get(ctx.self, "open") and not om.get(ctx.self, "broken") then
    ctx:veto("The glass case is sealed; you'd need to break it open first.")
end
```
