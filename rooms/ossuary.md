# Ossuary

- exits:
  - east: [Entry](#Entry)
  - down: catacombs
- map:
  - width: 29
  - height: 29
  - image: sample-dungeon/img/rooms/ossuary_background.jpg

> The Ossuary is silent in a way the rest of the Garden is not. The bone trees do not clatter near its threshold. A long descending corridor opens into a series of low vaulted chambers stacked floor-to-ceiling with disarticulated remains: shins in one bay, ribs in the next, hands cradling hands cradling hands until they ascend into the dark.

> The lowest vault is half-buried in silt and old bone, the ceiling so low that a tall person must stoop. At its centre a pit has been cut into the bedrock — older than the Ossuary, older than any arrangement of bones here — and from it comes a faint movement of cold air, as though the dark below is breathing. The shaft drops vertically for a distance before curving out of sight into the [Catacombs](#Catacombs) below.

> `if engine.entity_at(self.entity_id, "the_sigil") then` The [Sigil](#The%20Sigil) rests at the pit's edge, coiled in the dust as though it were placed there with great deliberation and has not been touched since. Its faint heat is the only warmth in the vault. `else` The pit's edge is bare — scoured clean in a ring where something rested here for a very long time. Whatever it was is gone now. `end`

#### Features

##### Pit

- kind: scenery
- aliases: [pit, descent, hole, shaft, vault pit, opening]

> A vertical shaft cut into the bedrock at the centre of the lowest vault, older than everything above it. Cold air rises from below, carrying the smell of stone and standing water. The pit descends to the [Catacombs](#Catacombs).
