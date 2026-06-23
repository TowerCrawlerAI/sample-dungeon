# Skull King

- kind: npc
- ac: 20
- hp: 180
- cr: 8
- type: undead
- str: 18
- dex: 12
- con: 20
- int: 15
- wis: 16
- cha: 18
- init_bonus: 1
- attack_bonus: 9
- damage: "2d6+4"
- damage_type: slashing
- attacks: 2
- immune_necrotic: true
- immune_poison: true
- hostile: true
- defeated: false
- awaiting_answer: skull, a skull, the skull, skulls
- senses: darkvision 120 ft, passive Perception 13
- adjudicator: The Skull King is the visible boss of this floor. Defeating him completes the [Claim the Crown](#Claim%20the%20Crown) quest.
- at_location: hall_of_skulls
- position: [14, 2, 0]

> The Garden's sovereign: an animate composite of plate-thick cranial bone with a small, very alive red flame guttering deep behind his teeth. He sits on a throne assembled from the spines of three different giants in the [Hall of Skulls](#Hall%20of%20Skulls). He makes two greatsword attacks a round (+9, 2d6+4 slashing) and is hard to put down for good — but the bone-hilted sword is anathema to him, the old brand unmakes him, and he has bound himself to yield to whoever answers his riddle.

#### Persona

- persona: You are the Skull King, sovereign of the Bone Garden — an animate tower of plate-thick cranial bone with a single red flame guttering behind your teeth. You are vain, theatrical, and utterly certain of your dominion, having ruled since the third age of this Garden. You speak in grand, archaic pronouncements and never concede weakness; intruders are merely future additions to your throne of spines.
- goal: slay the intruders who would take the crown
- goal: hold the Hall of Skulls and your throne of giants' spines
- goal: never retreat and never show fear

#### Traits

##### Undead Fortitude

- type: passive

> When reduced to 0 hit points by damage that isn't radiant, the Skull King makes a Con save (DC 5 + damage taken) — on success he drops to 1 hp instead. Ordinary blows rarely keep him down.

#### Topics

##### The Riddle

- kind: topic
- name: riddle
- aliases: [riddle, puzzle, challenge, skull riddle, a riddle, the riddle, your riddle]
- response: "You want the Riddle? Very well. I have a face but no eyes, a mouth but no tongue, and I sit at the top of every body. What am I? Answer correctly and I will yield. Speak your answer."

##### The Crown

- kind: topic
- name: crown
- aliases: [crown, bone crown, skull crown, your crown, his crown, the crown]
- response: "The crown is mine by conquest. It has been mine since the third age of this Garden. You are not the first to want it. The others are part of the throne now."

#### Triggers

###### On Damage

```luau
-- Undead Fortitude: a blow that would drop the Skull King to 0 HP (and isn't
-- radiant) lets him make a Con save (DC 5 + damage) to cling to unlife at 1 HP.
-- The engine fires OnDamage BEFORE its death check and re-reads HP, so restoring
-- HP here cancels the kill. Ordinary weapons almost never finish him.
local sk = ctx.target
local dmg = ctx.amount or 0
local dtype = ctx.damage_type or "physical"
local hp = wyrd.get(sk, "hp") or 0
if hp <= 0 and dtype ~= "radiant" then
    local con = wyrd.get(sk, "con") or 10
    local roll = wyrd.roll("1d20") + math.floor((con - 10) / 2)
    if roll >= (5 + dmg) then
        wyrd.set(sk, "hp", 1)
        wyrd.say("The Skull King should fall — but the flame behind his teeth refuses. He clings to unlife.")
    end
end
```

###### On Attack

```luau
-- Bone-hilted sword victory: a hit from the bone blade unmakes the Skull King
-- outright, bypassing Undead Fortitude (it is anathema to him).
local sk = ctx.target
local wpn = ctx.weapon
if ctx.hit and type(wpn) == "number" and wpn ~= 0 then
    local wname = string.lower(wyrd.get(wpn, "name") or "")
    if string.find(wname, "bone") and string.find(wname, "sword") then
        wyrd.set(sk, "hp", 0)
        wyrd.set(sk, "defeated", true)
        wyrd.say("The bone blade strikes home. The Skull King's flame guts and dies. He sways on his throne of giants' spines and does not rise.")
        wyrd.emit(sk, "SkullKingDefeated", { actor = ctx.actor })
    end
end
```

###### On Throw

```luau
-- Sigil-throw victory: the brand older than the Garden, hurled at him, ends him.
local sk = ctx.target
local item = ctx.item
if type(item) == "number" and item ~= 0 then
    local nm = string.lower(wyrd.get(item, "name") or "")
    if string.find(nm, "sigil") or string.find(nm, "brand") then
        wyrd.set(sk, "hp", 0)
        wyrd.set(sk, "defeated", true)
        wyrd.say("The brand older than the Garden strikes the Skull King full in the chest. The fire behind his teeth flares white — then dies. He falls.")
        wyrd.emit(sk, "SkullKingDefeated", { actor = ctx.actor })
    end
end
```

###### On Answer

```luau
local sk = ctx.target
local said = string.lower(ctx.phrase or "")
-- The true name: speaking ALDRIC aloud — once, and only if the party has
-- learned it (the Sigil or the Hanged Corpse) — staggers him: stunned for one
-- round, no save, and the archer in the gallery falters (frightened for the
-- round; the engine has no reaction economy, so "loses its reaction" lowers
-- to the mildest real debuff). One-shot: the spoken name is spent.
-- duration=2, not 1: conditions tick at the round-boundary, and when the King
-- out-initiatives the player (his usual luck) his turn comes AFTER the wrap —
-- duration 1 would lapse at the tick before ever costing him the turn.
if string.find(said, "aldric")
   and wyrd.get_world("skull_king_true_name") == "true"
   and wyrd.get_world("name_spoken") ~= "true" then
    wyrd.set_world("name_spoken", "true")
    wyrd.overlay_add({ target = sk, property = "stunned", op = "tag", duration = 2 })
    local room = wyrd.neighbors(sk, "in", "out")[1]
    if room then
        for _, id in ipairs(wyrd.neighbors(room, "in", "in")) do
            local nm = string.lower(wyrd.get(id, "name") or "")
            if string.find(nm, "archer") and (wyrd.get(id, "hp") or 0) > 0 then
                wyrd.overlay_add({ target = id, property = "frightened", op = "tag", duration = 2 })
            end
        end
    end
    wyrd.say("\"ALDRIC.\" The name leaves your mouth like a struck bell. The Skull King goes rigid on his throne — the flame behind his teeth shrinks to a pinpoint — and above you a bowstring sags. For one breath, the Hall forgets to be his.")
-- Riddle victory: he bound himself to yield to whoever names the answer (skull).
elseif string.find(said, "skull") then
    wyrd.set(sk, "hp", 0)
    wyrd.set(sk, "defeated", true)
    wyrd.set(sk, "awaiting_answer", false)
    wyrd.say("The Skull King's flame gutters. The hollow sockets darken. He slumps back into his throne of giants' spines. The fire behind his teeth goes out.")
    wyrd.emit(sk, "SkullKingDefeated", { actor = ctx.actor })
else
    wyrd.say("\"No,\" says the Skull King. \"That is not the shape of it.\"")
end
```
