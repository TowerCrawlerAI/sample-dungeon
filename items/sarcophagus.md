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

###### Before Take

```luau
-- Reach-path interception (om): the sarcophagus sits between the actor and any
-- item inside it, so this Before-stage SELF behaviour fires when something in it
-- is taken. While closed, veto the take. ctx.self is the sarcophagus (its own
-- `open` state); ctx.target is the item being taken.
if not om.get(ctx.self, "open") then
    ctx:veto("The sarcophagus is closed; you can't reach inside.")
end
```
