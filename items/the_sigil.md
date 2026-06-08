# The Sigil

- kind: item
- at_location: ossuary
- type: knowledge
- teaches: skull_king_true_name
- aliases: [sigil, brand, the brand]
- hidden: DC 16 Investigation in the Ossuary reveals the Sigil. Pressing it teaches the party `skull_king_true_name`. Speaking that name aloud during the [Throne Audience](#Throne%20Audience) triggers the `name_spoken` modifier.

> A brand the older bones were burned with before the Garden was the Garden, before the [Skull King](#Skull%20King) was anything but a king. Sleeps in the lowest vault of the [Ossuary](#Ossuary), beneath the dust of forgotten centuries.

#### Triggers

###### On Push

```luau
-- "Pressing" the Sigil (push) teaches the Skull King's true name — the same
-- `skull_king_true_name` flag the Hanged Corpse imparts. Idempotent.
engine.set_world("skull_king_true_name", "true")
engine.output("You press the cold brand. For an instant its worn lines flare, and a name rises unbidden into your mind — ALDRIC. You have learned the Skull King's true name.")
return true
```

