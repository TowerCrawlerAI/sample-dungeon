# Garden

- exits:
  - north: [Entry](#Entry)
- outdoor: true
- luminosity: 10
- adjudicator: The Garden is one logical room in the sim, but contains three distinct points of interest — the southeast spring ([Bone Construct](#Bone%20Construct) + [Spring Water](#Spring%20Water)), the eastern edge ([The Hanged Corpse](#The%20Hanged%20Corpse)), and the open silt itself (wandering encounters). Parties can engage any subset; none is required.

> The Garden proper — the flat silt expanse and bone forest that the [Entry](#Entry) gate opens into. Beyond the floor's two main destinations, the Garden is alive with smaller dangers and small mercies.

> In the **southeast quadrant**, a hollow rib channels a spring of cold, sweet water — see [Spring Water](#Spring%20Water). Touching the rib wakes the [Bone Construct](#Bone%20Construct) and triggers [Bone Construct Awakens](#Bone%20Construct%20Awakens).

> At the **eastern edge**, where the bone trees thin and the violet sky turns indigo, [The Hanged Corpse](#The%20Hanged%20Corpse) hangs from a noose of its own braided hair. The silt is undisturbed there; nothing has come close in a long time.

> Wandering encounters in the Garden are drawn from the [Bone Garden Wandering](#Bone%20Garden%20Wandering) table.

#### Supporters

##### Spring Rib

- aliases: [rib, hollow rib, spring rib]
- fillable_source: true
- contents: spring_water

> A massive curved rib half-buried in the silt, hollow at its peak. Spring water rises from inside it. The water is cold and shockingly clear against the grey silt. If you had something to carry it in, you could take a measure of it with you.

#### Implementation notes

The construct's waking lives where the events actually fire, not on the room
(`touch` emits `OnTouch` at the touched *thing*): [Spring Water](#Spring%20Water)'s
`On Touch` wakes the [Bone Construct](#Bone%20Construct) and opens the ambush;
the construct's own `On Damage` wakes it if struck while dormant.
