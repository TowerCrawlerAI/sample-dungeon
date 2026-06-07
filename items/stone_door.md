# Stone Door

### Stone Door

- kind: door
- connects: [twisting_tunnel_a7, crypt]
- state: closed
- aliases: [door, stone door, slab, stone slab]
- at_location: twisting_tunnel_a7

> A heavy stone slab set into the tunnel wall, dressed limestone like the
> vault beyond. It pivots on a central iron pin worn smooth by centuries
> of use — no lock, no bar, just weight. Someone strong enough could move
> it. It is closed.

#### Triggers

###### On Open

```luau
-- om reaction: ctx.target is the node the event fired on (this door);
-- engine.set_prop writes the graph node's own property.
engine.set_prop(ctx.target, "state", "open")
engine.output("You plant your shoulder against the stone slab and push. It grinds slowly on its pivot — a deep, resonant groan that echoes down the tunnels — and swings open. The way to the crypt is clear.")
```

###### On Close

```luau
engine.set_prop(ctx.target, "state", "closed")
engine.output("You heave the stone slab back into place. It seats itself with a low thud.")
```
