# Hall of Skulls

- exits:
  - south: [Entry](#Entry)

> The Hall of Skulls itself is a low basilica of bone, lit by oil-lamps suspended in the eye-sockets of a chandelier-skull the size of a small house. At the far end, on a throne assembled from the spines of three different giants, sits the [Skull King](#Skull%20King). His court of [Skeleton Archers](#Skeleton%20Archer) occupies the gallery above the floor and shoots through arrow-slits worked into the wall behind his throne.

> His crown is the prize most contestants come for — a band of beaten gold and finger-bones — and there is no path to it that does not run through him or around the loyalty of his court.

#### Supporters

##### Throne

> The throne is made of the spines of three different giants, each vertebra the size of a dinner plate, stacked and lashed with tendon.

#### Triggers

###### After Enter

- when: not flag(throne_audience_started)

[Throne Audience](#throne_audience)
Set [throne_audience_started](flag:throne_audience_started)
