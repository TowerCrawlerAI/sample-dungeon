# Sarcophagus

- kind: container
- at_location: crypt
- portable: false
- open: false
- openable: true
- enterable: true
- aliases: [sarcophagus, coffin, tomb, stone coffin, stone sarcophagus]

> A sarcophagus of pale limestone, its surface unadorned except for
> weathered chisel-marks that once formed a pattern. The lid fits
> tightly — not locked, but heavy enough that opening it requires
> deliberate effort. Whatever is inside has not been disturbed in
> a very long time.

#### Triggers

###### Test Take

```luau
-- Bubble exemplar: block taking items from inside the sarcophagus when closed.
-- The noun is the item being taken; this trigger fires because the sarcophagus
-- is the item's container (it is in the bubble chain).
-- When open, do nothing (let Test proceed normally).
if self.open ~= "true" then
    engine.fail_test("sarcophagus closed")
end
```

###### InsteadOf Take

```luau
-- Companion to Test Take: emit the refusal message when the sarcophagus is
-- closed and halt the action so no further stages fire.
if self.open ~= "true" then
    engine.output("The sarcophagus is closed; you can't reach inside.")
    engine.halt_action()
end
```
