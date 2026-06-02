# The Sigil

- kind: item
- at_location: ossuary
- type: knowledge
- teaches: skull_king_true_name
- aliases: [sigil, brand, the brand]
- appearance: > `if engine.get_property(self.entity_id, "at_location") == "ossuary" then` The Sigil rests coiled in the lowest vault, older than the Garden itself. `else` The Sigil lies here, a brand older than the Garden — out of place wherever this is not the Ossuary. `end`
- hidden: DC 16 Investigation in the Ossuary reveals the Sigil. Pressing it teaches the party `skull_king_true_name`. Speaking that name aloud during the [Throne Audience](#Throne%20Audience) triggers the `name_spoken` modifier.

> A brand the older bones were burned with before the Garden was the Garden, before the [Skull King](#Skull%20King) was anything but a king. Sleeps in the lowest vault of the [Ossuary](#Ossuary), beneath the dust of forgotten centuries.

