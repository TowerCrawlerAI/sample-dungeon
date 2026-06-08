# Entry

- exits:
  - north: [Hall of Skulls](#Hall%20of%20Skulls)
  - west: [Ossuary](#Ossuary)
  - south: [Garden](#Garden)
- outdoor: true
- luminosity: 10
- hidden: DC 12 Perception detects the things beneath the silt. Parties that linger or argue loudly for more than 10 in-fiction minutes trigger the [Gate Ambush](#Gate%20Ambush).

> The entrance to the Garden proper is a gate of welded vertebrae, each disc the size of a shield, and beyond it the path forks. To the [north](#Hall%20of%20Skulls), the silt is trampled into a road by something heavy and recent; the road climbs toward the [Hall of Skulls](#Hall%20of%20Skulls). To the [west](#Ossuary), the bone trees grow thicker, and between them a half-buried doorway hints at an older site: the [Ossuary](#Ossuary), reputed to be where the best treasures still lie undisturbed by the current sovereign's tax-collectors.

> Many parties have argued, over the threshold, about which way to go first; one or two have argued long enough to be picked off where they stood by the things that move under the silt.

#### Features

##### Gate

- kind: scenery

> The entrance to the Garden proper: a gate of welded vertebrae, each disc the size of a shield.

#### Triggers

###### After Enter

- when: time_in_room(party) is greater than 10 and noise_level(party) is greater than or equal to 2

[Gate Ambush](#gate_ambush)
