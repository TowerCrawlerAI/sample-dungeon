# Bone-Hilted Sword

- kind: item
- at_location: sarcophagus
- portable: true
- takeable: true
- aliases: [sword, blade, bone-hilted sword, bone hilted sword, long blade]

> A slender blade, longer than a shortsword by several inches, forged
> from an alloy the Bone Garden's archers cannot name or replicate. The
> hilt is a single piece of carved bone — not assembled from scraps
> like the Skull King's constructs, but shaped from one continuous
> piece, warm to the touch in a way that cold stone should not allow.
> Whoever placed this here intended it to stay.

#### Triggers

###### After Attack With

```luau
-- Preposition-suffix trigger: fires when this sword is used as the instrument
-- in "hit <target> with sword". ctx.noun is the target; ctx.noun_2 is this sword.
engine.output("The bone hilt grows warm as the blade strikes home.")
```
