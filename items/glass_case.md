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

###### InsteadOf Attack

```luau
-- Bubble exemplar: the glass case intercepts Attack when the target is
-- inside it (the case is in the noun's bubble chain).
-- Break the case, allow the contents to be accessed.
if self.open ~= "true" then
    engine.set_property(self.entity_id, "broken", "true")
    engine.set_property(self.entity_id, "open", "true")
    engine.output("The glass shatters; the contents tumble free.")
    engine.halt_action()
end
```

###### Test Take

```luau
-- When closed (and not broken), block taking items from inside.
if self.open ~= "true" and self.broken ~= "true" then
    engine.fail_test("glass case sealed")
end
```

###### InsteadOf Take

```luau
-- Companion: emit the refusal when case is sealed.
if self.open ~= "true" and self.broken ~= "true" then
    engine.output("The glass case is sealed; you'd need to break it open first.")
    engine.halt_action()
end
```
