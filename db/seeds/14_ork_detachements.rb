puts "Creating Ork detachments..."

def create_ork_detachments(ork_detachments)
    ork_army_id = $grim_dark_armies["Orks"].id
    ork_detachments.each do |detachment|
        keyword = $keywords[detachment[:keyword_id]] if detachment[:keyword_id]
        model = $ork_models[detachment[:model_id]] if detachment[:model_id]
        Detachment.create({
            detachment_name: detachment[:detachment_name],
            detachment_description: detachment[:detachment_description],
            rule_name: detachment[:rule_name],
            rule_description: detachment[:rule_description],
            rule: detachment[:rule],
            keyword_info: detachment[:keyword_info],
            model_id: model ? model[:id] : nil,
            keyword_id: keyword ? keyword[:id] : nil,
            army_id: ork_army_id
        })
    end
end

ork_detachments = [
  {
    detachment_name: "Taktikal Brigade",
    detachment_description: "The Orks who belong to the Blood Axe clan seek to apply their own brand of taktiks to their endless wars. The most cunning of Blood Axe leaders have adapted the strategies of other species into a unique brand of clandestine warfare that, whilst simplistic, is brutally effective.",
    rule_name: "Lissen 'Ere",
    rule_description: "Blood Axe leaders bellow actual orders to the ladz under their command.",
    rule: "Once per battle round, in your Command phase or after being set up on the battlefield in your Movement phase, each BOSS SNIKROT, MEK and WARBOSS model in your army can issue Taktiks abilities.
        To do so, select one of the Taktiks abilities below and select one friendly ORKS unit within 6\" of that model to issue them to. That model must take a Leadership test: if failed, the selected unit suffers 1 mortal wound. Until the start of your next Command phase, the selected unit is affected by the selected Taktik. A unit cannot have Taktiks issued to it in this way more than once per battle round.
        Taktiks abilities cannot be issued to Battle-shocked units, and if a unit affected by Taktiks becomes Battle-shocked, all Taktiks cease to affect that unit while it is Battle-shocked.
        Get Stuck In: You can re-roll Charge rolls made for this unit.
        Get On Wiv It: Add 1 to the Strength characteristic of melee weapons equipped by models in this unit.
        Sneaky Stalkin’: INFANTRY and MOUNTED models (excluding MEGANOBZ) in this unit have the Stealth ability and each time a ranged attack targets this unit, those models have the Benefit of Cover against that attack.
        Shoota Drills: Each time an INFANTRY or MOUNTED model in this unit makes a ranged attack, add 1 to the Hit roll.",
    keyword_info: "Stormboyz units from your army gain the Battleline keyword.",
    model_id: "Stormboyz",
    keyword_id: "Battleline"
  }, {
    detachment_name: "War Horde",
    rule_name: "Get Stuck In",
    rule_description: "Once an Ork gets stuck into hand-to-hand combat, they quickly overwhelm their enemies through sheer ferocity and an eagerness to give the gitz a good kicking.",
    rule: "Melee weapons equipped by ORKS models from your army have the [SUSTAINED HITS 1] ability."
  }, {
    detachment_name: "Da Big Hunt",
    rule_name: "Da Hunt Is On",
    rule_description: "Spying the largest or most dangerous threats on the battlefield - besides the Orks themselves - Beast Snaggas chase them down with gleeful enthusiasm, mobs racing each other to claim the kill and to snag a worthy trophy with which to proclaim their status as the warband’s greatest hunters. Until, that is, the easily distracted ladz notice their next quarry.",
    rule: "At the start of your Command phase, select one MONSTER, VEHICLE or CHARACTER unit from your opponent’s army. Until the start of your next Command phase, that enemy unit is your Prey:
        Each time a BEAST SNAGGA unit from your army declares a charge that includes your Prey as one of the targets, you can re-roll the Charge roll.
        Each time a BEAST SNAGGA model from your army makes an attack that targets your Prey, improve the Armour Penetration characteristic of that attack by 1."
  }, {
    detachment_name: "Kult of Speed",
    rule_name: "Adrenaline Junkies",
    rule_description: "If there is one thing Speed Freeks love more than racing full tilt towards the enemy, smashing into them and pulling hair pin turns to do it all again, it is loosing incredible amounts of noisy, chugging dakka as they do so.",
    rule: "Speed Freeks units from your army are eligible to shoot in a turn in which they Advanced or Fell Back."
  }, {
    detachment_name: "Dread Mob",
    rule_name: "Try Dat Button!",
    rule_description: "Inventive Meks wire all manner of kustomised gubbinz, suspicious extras and inviting big red buttons to weapons or into the cockpits of their clanking kan creations. Eager Orks are always enthusiastic to try out such random innovations to see what sort of destruction they can cause. Sometimes this can be risky, but that’s half the fun!",
    rule: "Each time a Mek, Orks Walker or Grots Vehicle unit from your army is selected to shoot or fight, roll one D6. Until the end of the phase, weapons equipped by models in that unit have the corresponding ability shown in the table below.
        On a 1 or 2: [SUSTAINED HITS 1] ability.
        On a 3 or 4: [LETHAL HITS] ability.
        On a 5 or 6: Each time an attack is made with this weapon, on a Critical Wound, improve the Armour Penetration characteristic of that attack by 2.
        Alternatively, when such a unit is selected to shoot or fight, you can select one of the abilities above instead of rolling the D6. If you do, until the end of the phase, weapons equipped by models in that unit have the [HAZARDOUS] ability as well.
        If a weapon equipped by a model from you army has the [HAZARDOUS] ability from multiple sources, each time you take a Hazardous test for that weapon, it is failed on a roll of a 1 or a 2.",
    keyword_info: "Gretchin units from your army gain the Battleline keyword.",
    model_id: "Gretchin",
    keyword_id: "Battleline"
  }, {
    detachment_name: "Green Tide",
    rule_name: "Mob Mentality",
    rule_description: "Caught up in the infectious and nigh supernatural belligerence that suffuses such large hordes of Orks on the warpath, the Boyz tend to push through lethal wounds, being too immersed in the energetic riot to worry about such things as long as they have a load of mates to enjoy the fight with.",
    rule: "Each time an attack targets a BOYZ unit from your army, models in that unit have a 6+ invulnerable save against that attack. Each time an attack targets a BOYZ unit from your army that contains 10 or more models, models in that unit have a 5+ invulnerable save against that attack."
  }, {
    detachment_name: "Bully Boyz",
    rule_name: "Da Boss Is Watchin’",
    rule_description: "Gathered together into an all-conquering mass of hulking brutes, the biggest Nobz and their even larger bosses are - or so they claim - more Orky than anyone else. Their bellowed war cries are louder, their self-belief, impetus and sheer presence an affront to the senses. Theirs is a violent momentum that can roll through entire enemy armies in an unrelenting wave of aggression.",
    rule: "At the start of your Command phase, in a turn in which you have not called a Waaagh!, if you have one or more WARBOSS models on the battlefield (or embarked within a TRANSPORT that is on the battlefield), you can call a Waaagh! for a second time this battle. When doing so, that second Waaagh! only counts as having been called for WARBOSS, NOBZ and MEGANOBZ units from your army."
  }, {
    detachment_name: "More Dakka!",
    detachment_description: "Of all the Ork manias, few are as widespread as the love of heavy firepower. Temporarily united by a shared love of loud and destructive dakka, hordes of similarly obsessed Orks can produce storms of killing fire capable of felling even the most heavily armoured of enemies.",
    rule_name: "Dakka! Dakka! Dakka!",
    rule_description: "Orks have no real concept of ammunition preservation, instead tending to hold the trigger down until their ammunition runs dry or their weapon falls apart in their hands.",
    rule: "Ranged weapons equipped by ORKS INFANTRY and ORKS WALKER models from your army have the [ASSAULT] ability.
        While the Waaagh! is active for your army, during your Shooting phase, ranged weapons equipped by ORKS INFANTRY and ORKS WALKER models from your army have the [SUSTAINED HITS 1] ability"
  }
]

create_ork_detachments(ork_detachments)
$ork_detachments = {}
Detachment.where(army_id: $grim_dark_armies["Orks"].id).map { |detachment| $ork_detachments[detachment.detachment_name] = detachment }

puts "Ork detachments created successfully."
