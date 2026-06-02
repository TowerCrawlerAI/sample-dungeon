# Skull King

- ac: 20
- hp: 180
- cr: 8
- type: undead
- speed: 30 ft
- str: 18
- dex: 12
- con: 20
- int: 15
- wis: 16
- cha: 18
- senses: darkvision 120 ft, passive Perception 13
- damage_immunities: poison, necrotic
- condition_immunities: poisoned, frightened, charmed, exhaustion
- defeated: false
- adjudicator: The Skull King is the visible boss of this floor. Defeating him completes the [Claim the Crown](#Claim%20the%20Crown) quest.
- at_location: hall_of_skulls

> The Garden's sovereign: an animate composite of plate-thick cranial bone with a small, very alive red flame guttering deep behind his teeth. He sits on a throne assembled from the spines of three different giants in the [Hall of Skulls](#Hall%20of%20Skulls). He receives audiences. He prefers to receive them lethally, but he is bound by old courtesy to give visitors the choice.

#### Traits

##### Bound by Old Courtesy

- type: passive

> At the start of any combat in his throne room, the Skull King must offer a single greeting and wait one round before rolling initiative.

##### Flame Behind Teeth

- type: passive

> Sheds dim light in a 10-foot radius from the throne.

##### Undead Fortitude

- type: passive

> When reduced to 0 hit points by damage that isn't radiant or from a critical hit, the Skull King makes a Con save (DC 5 + damage taken) — on success he drops to 1 hp instead.

#### Topics

##### The Crown

- kind: topic
- name: crown
- aliases: [crown, bone crown, skull crown, your crown, his crown, the crown]
- response: "The crown is mine by conquest. It has been mine since the third age of this Garden, when I took it from a paladin fool enough to offer me a duel. You are not a paladin."

##### The Bone Garden

- kind: topic
- name: garden
- aliases: [garden, this place, bone garden, floor, the garden, the floor]
- response: "The Garden tends itself. It has done so for a very long time. The bones grow back. The archers regenerate. I do not know why you would choose to be here."

##### The Exit

- kind: topic
- name: exit
- aliases: [exit, way out, how to leave, leave, escape, door, out]
- response: "There is a brand older than this Garden. Find it, and you may discover your own answer. I will not simply tell you — that is not courtesy, that is charity."

##### The Sigil

- kind: topic
- name: sigil
- aliases: [sigil, brand, the brand, the sigil, old brand]
- response: "That brand was here before I was. Before this Garden was. I did not make it. I do not know who did. I know only that it predates me, and that is not a comfortable thought."

##### The Riddle

- kind: topic
- name: riddle
- aliases: [riddle, puzzle, challenge, skull riddle, a riddle, the riddle, your riddle]
- response: "You want the Riddle? Very well. I have a face but no eyes, a mouth but no tongue, and I sit at the top of every body. What am I? Answer correctly and I will yield. Speak your answer."

#### Triggers

###### After Damaged

**If** damage kills self and damage type is not radiant and damage is not crit:
  Save self Con DC 5 + damage amount
  **If** save succeeds:
    Set self HP to 1
    Block the death
  **End.**
**End.**

###### On Ask

```luau
-- Side effect when the Skull King is asked about a topic.
-- If the riddle topic is asked, set awaiting_answer so the answer verb can verify it.
local topic = ctx.noun_2
if topic then
    local topic_name = topic.name or topic.id or ""
    if topic_name == "riddle" or topic_name == "the_riddle" then
        -- Set the awaiting answer (comma-separated acceptable forms).
        if ctx.noun and ctx.noun.entity_id then
            engine.set_property(ctx.noun.entity_id, "awaiting_answer", "skull,a skull,the skull,skulls")
        end
    end
end
```

###### On Answer

```luau
-- Fired by the answer verb after a correct answer to the Skull King's riddle.
-- ctx.noun is the Skull King entity table passed from the answer verb's trigger_ctx.
local sk_id = ctx.noun and ctx.noun.entity_id or nil
if sk_id then
    engine.set_property(sk_id, "defeated", "true")
end
engine.output("The Skull King's flame gutters. The hollow sockets darken. He slumps, very slowly, back into his throne of giants' spines. The fire behind his teeth goes out.")
engine.fire_event("SkullKingDefeated", sk_id or 0, {})
return true
```

###### After Throw

```luau
-- Victory path: throw the Sigil at the Skull King.
-- ctx.noun is the thrown item; ctx.noun_2 is this entity (the target).
local thrown = ctx.noun
local target = ctx.noun_2
if thrown and target and target.entity_id then
    local thrown_id = thrown.id or ""
    local thrown_name = (thrown.name or ""):lower()
    if thrown_id == "the_sigil" or thrown_name:find("sigil") then
        engine.set_property(target.entity_id, "defeated", "true")
        engine.output("The brand older than the Garden strikes the Skull King full in the chest. The fire behind his teeth flares white — then dies. He falls. The sigil clatters to the floor.")
        engine.fire_event("SkullKingDefeated", target.entity_id, {})
    end
end
```

###### After Attack

```luau
-- Victory path: attack the Skull King with the bone-hilted sword.
-- ctx.noun is this entity (the target); ctx.noun_2 is the weapon (optional).
local target = ctx.noun
local weapon = ctx.noun_2
if target and target.entity_id and weapon then
    local weapon_id = weapon.id or ""
    local weapon_name = (weapon.name or ""):lower()
    if weapon_id == "bone_hilted_sword" or (weapon_name:find("bone") and weapon_name:find("sword")) then
        engine.set_property(target.entity_id, "defeated", "true")
        engine.output("The bone blade strikes home. The Skull King's flame guts and dies. He sways on his throne of giants' spines and does not rise.")
        engine.fire_event("SkullKingDefeated", target.entity_id, {})
    end
end
```
#### Actions

##### Multiattack

> The Skull King makes two greatsword attacks.

##### Greatsword

- attack_bonus: 9
- damage: "2d6+4"
- damage_type: slashing
- reach: 5

> Melee Weapon Attack, +9 to hit, reach 5 ft. Hit: 11 (2d6+4) slashing damage.

##### Bone Scepter (Recharge 5-6)

- recharge: "5-6"
- range: 60 ft cone
- save: dc16-con
- damage: "6d6"
- damage_type: necrotic
- half_on_save: true

> 60-foot cone, DC 16 Constitution save, 21 (6d6) necrotic damage on fail, half on success.

#### Legendary Actions

##### Summon Archer

> Call one [Skeleton Archer](#Skeleton%20Archer) from the gallery if any remain there.

##### Shift the Floor

- save: dc14-dex
- effect: forced_move
- distance: 10 ft

> One creature within 30 ft. must make a DC 14 Dex save or be moved 10 ft. through the silt.
