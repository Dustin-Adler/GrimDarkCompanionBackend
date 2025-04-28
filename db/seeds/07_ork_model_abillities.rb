
puts "Creating Ork model abilities..."

def create_ork_model_abilities(ork_model_abilities)
    ork_model_abilities.each do |model_name, ability_data|
        puts "Failed to create abilities for #{model_name}" unless $ork_models[model_name]
        Ability.create({
            name: ability_data[:name],
            rule: ability_data[:rule],
            example: ability_data[:example],
            model_id: $ork_models[model_name].id,
            ability_type: "MODEL"
        })
    end
end

ork_model_abilities = {}

ork_model_abilities["Battlewagon"] = {
    name: "Ramshackle but Rugged",
    rule: "Each time an attack is allocated to this model, worsen the Armour Penetration characteristic of that attack by 1."
}

ork_model_abilities["Beast Snagga Boyz - Boy"] = {
    name: "Monster Hunters",
    rule: "Each time a model in this unit makes an attack that targets a MONSTER or VEHICLE unit, you can re-roll the Hit roll."
}

ork_model_abilities["Beast Snagga Boyz - Nob"] = {
    name: "Monster Hunters",
    rule: "Each time a model in this unit makes an attack that targets a MONSTER or VEHICLE unit, you can re-roll the Hit roll."
}

ork_model_abilities["Beastboss"] = {
    name: "Beastboss",
    rule: "While this model is leading a unit, each time a model in that unit makes a melee attack, add 1 to the Hit roll."
}

ork_model_abilities["Beastboss"] = {
    name: "Beastly Rage",
    rule: "Each time this model makes a Charge move, until the end of the turn, melee weapons it is equipped with have the [DEVASTATING WOUNDS] ability."
}

ork_model_abilities["Beastboss On Squigosaur"] = {
    name: "Thundering Stampede",
    rule: "While this model is leading a unit, add 1 to Charge rolls made for that unit."
}

ork_model_abilities["Big Mek"] = {
    name: "More Dakka",
    rule: "While this model is leading a unit, each time a model in that unit makes a ranged attack, re-roll a Hit roll of 1."
}

ork_model_abilities["Big Mek"] = {
    name: "More Dakka",
    rule: "While this model is leading a unit, each time a model in that unit makes a ranged attack, re-roll a Hit roll of 1."
}

ork_model_abilities["Big Mek In Mega Armour"] = {
    name: "Shokk-Boosta",
    rule: "You can re-roll Advance rolls made for this model’s unit. In addition, each time this model’s unit makes a Normal, 
        Advance or Fall Back move, until that move is finished, models in that unit can move horizontally through models and terrain features 
        (but cannot finish a move on top of another model or its base)."
}

ork_model_abilities["Big Mek With Shokk Attack Gun"] = {
    name: "More Dakka",
    rule: "While this model is leading a unit, each time a model in that unit makes a ranged attack, re-roll a Hit roll of 1."
}

ork_model_abilities["Big Mek With Shokk Attack Gun"] = {
    name: "Deranged Snotling Assault",
    rule: "In your Shooting phase, after this model has shot, select one enemy unit hit by one or more of those attacks; that unit must take a Battle-shock test."
}

ork_model_abilities["Big’ed Bossbunka"] = {
    name: "Ramshackle Cover",
    rule: "Each time a ranged attack is allocated to a model, if that model is not fully visible to every model in the attacking 
        unit because of this FORTIFICATION, that model has the Benefit of Cover against that attack."
}

ork_model_abilities["Big’ed Bossbunka"] = {
    name: "Shoutin’ Pole (Aura)",
    rule: "While a friendly ORKS unit is within 6\" of this FORTIFICATION, improve the Leadership characteristic of models in that unit by 1."
}

ork_model_abilities["Big’ed Bossbunka"] = {
    name: "Fortification",
    rule: "While an enemy unit is only within Engagement Range of one or more FORTIFICATIONS from your army:
        That unit can still be selected as the target of ranged attacks, but each time such an attack is made, unless it is made with a Pistol, subtract 1 from the Hit roll.
        Models in that unit do not need to take Desperate Escape tests due to Falling Back while Battle-shocked, except for those that will move over enemy models when doing so."
}

ork_model_abilities["Blitza-bommer"] = {
    name: "Boom Bomb",
    rule: "Each time this model ends a Normal move, you can select one enemy unit it moved over during that move and roll one D6: on a 4+, that unit suffers D6 mortal wounds."
}


ork_model_abilities["Boomdakka Snazzwagon"] = {
    name: "Dust Trails (Aura)",
    rule: "While an enemy unit (excluding MONSTERS and VEHICLES) is within 6\" of this model, each time a model in that unit makes an attack, subtract 1 from the Hit roll."
}

ork_model_abilities["Boss Snikrot"] = {
    name: "Red Skull Kommandos",
    rule: "While this model is leading a unit, models in that unit have the Benefit of Cover."
}

ork_model_abilities["Boss Snikrot"] = {
    name: "Kunnin’ Infiltrator",
    rule: "Once per battle, in your Movement phase, instead of making a Normal move with this model’s unit, you can remove it from the battlefield and set it up again anywhere 
        on the battlefield that is more than 9\" horizontally away from all enemy models."
}

ork_model_abilities["Boyz - Boss Nob"] = {
    name: "Get Da Good Bitz",
    rule: "At the end of your Command phase, if this unit is within range of an objective marker you control, that objective marker remains under your control, even if you have 
        no models within range of it, until your opponent controls it at the start or end of any turn."
}

ork_model_abilities["Boyz - Boy"] = {
    name: "Get Da Good Bitz",
    rule: "At the end of your Command phase, if this unit is within range of an objective marker you control, that objective marker remains under your control, even if you have 
        no models within range of it, until your opponent controls it at the start or end of any turn."
}

ork_model_abilities["Breaka Boyz - Boss Nob"] = {
    name: "Trophy Hunters",
    rule: "Each time this unit declares a charge, you can re-roll the Charge roll."
}

ork_model_abilities["Breaka Boyz - Boss Nob"] = {
    name: "Bomb Squigs",
    rule: "Twice per battle, after this unit ends a Normal move, you can select one enemy unit within 12\" of it and roll one D6: on a 2+, that enemy unit suffers D3 mortal wounds.",
    example: "Place two Bomb Squig tokens next to the unit, removing one each time this unit uses this ability."
}

ork_model_abilities["Breaka Boyz - Boy"] = {
    name: "Trophy Hunters",
    rule: "Each time this unit declares a charge, you can re-roll the Charge roll."
}

ork_model_abilities["Breaka Boyz - Boy"] = {
    name: "Bomb Squigs",
    rule: "Twice per battle, after this unit ends a Normal move, you can select one enemy unit within 12\" of it and roll one D6: on a 2+, that enemy unit suffers D3 mortal wounds.",
    example: "Place two Bomb Squig tokens next to the unit, removing one each time this unit uses this ability."
}

ork_model_abilities["Burna Boyz - Boy"] = {
    name: "Pyromaniaks",
    rule: "Each time a model in this unit makes a ranged attack with a burna that targets an enemy unit within 6\", re-roll a Wound roll of 1. 
        If the target of that attack is also within range of an objective marker, you can re-roll the Wound roll instead."
}

ork_model_abilities["Burna Boyz - Spanner"] = {
    name: "Pyromaniaks",
    rule: "Each time a model in this unit makes a ranged attack with a burna that targets an enemy unit within 6\", re-roll a Wound roll of 1. 
        If the target of that attack is also within range of an objective marker, you can re-roll the Wound roll instead."
}

ork_model_abilities["Burna-bommer"] = {
    name: "Burna Bomb",
    rule: "Each time this model ends a Normal move, you can select one enemy unit it moved over during that move. 
        Until the end of the turn, models in that unit cannot have the Benefit of Cover. In addition, roll one D6 for each model in that unit: for each 6, that unit suffers 1 mortal wound."
}

ork_model_abilities["Dakkajet"] = {
    name: "Dakkastorm",
    rule: "Each time this model makes a ranged attack, every successful Hit roll scores a Critical Hit."
}

ork_model_abilities["Deff Dread"] = {
    name: "Piston-Driven Brutality",
    rule: "At the start of the Fight phase, each enemy unit within Engagement Range of one or more units with this ability must take a Battle-shock test."
}

ork_model_abilities["Deffkilla Wartrike"] = {
    name: "Speedboss",
    rule: "While this model is leading a unit, each time a model in that unit makes a melee attack, add 1 to the Hit roll."
}

ork_model_abilities["Deffkilla Wartrike"] = {
    name: "Fuel-Mixa Grot",
    rule: "Each time this model’s unit Advances, do not make an Advance roll for it. Instead, until the end of the phase, add 6\" to the Move characteristic of models in this model’s unit."
}

ork_model_abilities["Deffkoptas"] = {
    name: "Deff from Above",
    rule: "Each time this unit ends a Normal move, you can select one enemy unit it moved over during that move and roll one D6 for each model in this unit: 
        for each 4+, that enemy unit suffers 1 mortal wound."
}

ork_model_abilities["Flash Gitz"] = {
    name: "Gun-Crazy Show-Offs",
    rule: "Each time a model in this unit targets the closest eligible target with its snazzgun, until the end of the phase, that weapon has an Attacks characteristic of 4."
}

ork_model_abilities["Gargantuan Squiggoth"] = {
    name: "Gargantuan",
    rule: "Each time this model makes a Normal, Advance or Fall Back move, it can move over models (excluding TITANIC models) and terrain features that are 4\" 
        or less in height as if they were not there."
}

ork_model_abilities["Gargantuan Squiggoth"] = {
    name: "Walking Bastion",
    rule: "This model does not suffer the penalty to its Hit rolls for making ranged attacks while enemy units are within Engagement Range of it."
}

ork_model_abilities["Ghazghkull Thraka"] = {
    name: "Prophet of Da Great Waaagh!",
    rule: "While this unit is leading a unit, each time a model in that unit makes a melee attack, add 1 to the Hit roll and add 1 to the Wound roll and if the Waaagh! 
        is active for your army, a Critical Hit is scored on a successful unmodified Hit roll of 5+."
}

ork_model_abilities["Gorkanaut"] = {
    name: "Clankin’ Forward",
    rule: "Each time this model makes a Normal, Advance or Fall Back move, it can move over enemy models (excluding MONSTER and VEHICLE models) and terrain features 
        that are 4\" or less in height as if they were not there."
}

ork_model_abilities["Gorkanaut"] = {
    name: "Big an’ Stompy",
    rule: "Each time this model makes a melee attack, if the Waaagh! is active for your army, add 1 to the Hit roll."
}

ork_model_abilities["Gretchin - Grot"] = {
    name: "Thievin’ Scavengers",
    rule: "At the start of your Movement phase, roll one D6 for each objective marker you control that has one or more 
        units from your army with this ability within range of it (excluding Battle-shocked units). If one or more of those rolls is a 4+, you gain 1CP."
}

ork_model_abilities["Gretchin - Runtherd"] = {
    name: "Runtherd",
    rule: "While this unit contains one or more Gretchin models, each time an attack targets this unit, Runtherd models in this unit have a Toughness characteristic of 2."
}

ork_model_abilities["Hunta Rig"] = {
    name: "On Da Hunt",
    rule: "For each model embarked within this TRANSPORT, add 1 to the Attacks characteristic of this model’s butcha boyz weapon (to a maximum of +6). 
        The Attacks characteristic of that weapon can be modified even though it is an Extra Attacks weapon."
}

ork_model_abilities["Kill Rig"] = {
    name: "Spirit of Gork (Psychic)",
    rule: "At the start of the Fight phase, you can select one friendly Orks unit within 12\" of this model and roll one D6: on a 1, 
        this model suffers D3 mortal wounds; on a 2-5, until the end of the phase, add 1 to the Strength characteristic of melee weapons equipped by models in that unit; 
        on a 6, until the end of the phase, add 1 to the Strength characteristic of melee weapons equipped by models in that unit and those weapons have the [LETHAL HITS] ability."
}

ork_model_abilities["Killa Kans"] = {
    name: "Shooty Power Trip",
    rule: "Each time this unit is selected to shoot, you can roll one D6:
        On a 1-2, this unit suffers D6 mortal wounds.
        On a 3-4, until the end of the phase, add 1 to the Strength characteristic of ranged weapons equipped by models in this unit.
        On a 5-6, until the end of the phase, add 1 to the Attacks characteristic of ranged weapons equipped by models in this unit."
}

ork_model_abilities["Kommandos - Boss Nob"] = {
    name: "Sneaky Surprise",
    rule: "Enemy units cannot use the Fire Overwatch Stratagem to shoot at this unit."
}

ork_model_abilities["Kommandos - Kommando"] = {
    name: "Sneaky Surprise",
    rule: "Enemy units cannot use the Fire Overwatch Stratagem to shoot at this unit."
}

ork_model_abilities["Lootas - Loota"] = {
    name: "Dat’s Our Loot!",
    rule: "Each time a model in this unit makes a ranged attack, re-roll a Hit roll of 1. If that attack targets a unit that is within range of an objective marker, 
        you can re-roll the Hit roll instead."
}

ork_model_abilities["Lootas - Spanner"] = {
    name: "Dat’s Our Loot!",
    rule: "Each time a model in this unit makes a ranged attack, re-roll a Hit roll of 1. If that attack targets a unit that is within range of an objective marker, 
        you can re-roll the Hit roll instead."
}

ork_model_abilities["Makari"] = {
    name: "Ghazghkull’s Waaagh! Banner (Aura)",
    rule: "While a friendly ORKS unit is within 12\" of Makari, if the Waaagh! is active for your army, melee weapons equipped by models in that unit have the [LETHAL HITS] ability.
"
}

ork_model_abilities["Meganobz"] = {
    name: "Krumpin’ Time",
    rule: "While the Waaagh! is active for your army, models in this unit have the Feel No Pain 5+ ability."
}

ork_model_abilities["Megatrakk Scrapjet"] = {
    name: "Drill Through",
    rule: "Each time this model ends a Charge move, select one enemy unit within Engagement Range of it and roll one D6: on a 2-5, that enemy unit suffers D3 mortal wounds; 
        on a 6, that enemy unit suffers 3 mortal wounds."
}

ork_model_abilities["Mek"] = {
    name: "Mekboy",
    rule: "While this model is within 3\" of one or more friendly ORKS VEHICLE units, this model has the Lone Operative ability."
}

ork_model_abilities["Mek"] = {
    name: "Mekaniak",
    rule: "At the end of your Movement phase, you can select one friendly ORKS VEHICLE model within 3\" of this model. That VEHICLE model regains up to D3 lost wounds, 
        and, until the start of your next Movement phase, each time that VEHICLE model makes an attack, add 1 to the Hit roll. Each model can only be selected for this ability once per turn."
}

ork_model_abilities["Mek Gunz"] = {
    name: "Splat!",
    rule: "Each time a model in this unit makes a ranged attack that targets a unit that is at its Starting Strength (excluding MONSTERS and VEHICLES), re-roll a Hit roll of 1."
}

ork_model_abilities["Morkanaut"] = {
    name: "Clankin’ Forward",
    rule: "Each time this model makes a Normal, Advance or Fall Back move, it can move over enemy models (excluding MONSTER and VEHICLE models) and terrain features that are 4\" 
        or less in height as if they were not there."
}

ork_model_abilities["Morkanaut"] = {
    name: "Big an’ Shooty",
    rule: "Each time this model makes a ranged attack, if the Waaagh! is active for your army, add 1 to the Hit roll."
}

ork_model_abilities["Mozrog Skragbad"] = {
    name: "One Last Kill",
    rule: "While this model is leading a unit, each time a model in that unit is destroyed by a melee attack, if it has not fought this phase, roll one D6: on a 4+, do not remove it from play. 
        The destroyed model can fight after the attacking unit has finished making its attacks, and is then removed from play."
}

ork_model_abilities["Mozrog Skragbad"] = {
    name: "Da Bigger Dey iz...",
    rule: "Each time this model makes a melee attack that targets a MONSTER or VEHICLE unit, add 1 to the Damage characteristic of that attack. Each time this model makes a melee attack that 
        targets a TITANIC unit, add 2 to the Damage characteristic of that attack instead."
}

ork_model_abilities["Nobz"] = {
    name: "Da Boss’ Ladz",
    rule: "While a WARBOSS model is leading this unit, each time an attack targets this unit, if the Strength characteristic of that attack is greater than the 
        Toughness characteristic of this unit, subtract 1 from the Wound roll."
}

ork_model_abilities["Painboss",] = {
    name: "Dok’s Toolz",
    rule: "While this model is leading a unit, models in that unit have the Feel No Pain 5+ ability."
}

ork_model_abilities["Painboss",] = {
    name: "Sawbonez",
    rule: "At the end of your Movement phase, select one friendly BEAST SNAGGA CHARACTER model within 3\" of this model. That model is healed and regains up to 3 lost wounds. Each model can only be healed once per turn.."
}

ork_model_abilities["Painboy"] = {
    name: "Dok’s Toolz",
    rule: "While this model is leading a unit, models in that unit have the Feel No Pain 5+ ability."
}

ork_model_abilities["Painboy"] = {
    name: "Hold Still and Say ‘Aargh!’",
    rule: "Each time an attack made by this model with its ’urty syringe scores a Critical Wound against a unit (excluding VEHICLE units), that unit suffers D6 mortal wounds."
}

ork_model_abilities["Rukkatrukk Squigbuggy"] = {
    name: "Buzzer Squigs",
    rule: "In your Shooting phase, after this model has shot, select one enemy unit (excluding MONSTERS and VEHICLES) hit by one or more of those attacks 
        made with squig-launchas and roll one D6: on a 4+, until the end of your opponent’s next turn, that enemy unit is hindered. While a unit is hindered, 
        subtract 2\" from its Move characteristic and subtract 2 from Advance and Charge rolls made for it."
}

ork_model_abilities["Rukkatrukk Squigbuggy"] = {
    name: "Squig Mine",
    rule: "Once per battle, at the start of any phase, select one enemy unit within 3\" of this model and roll one D6: on a 4+, that enemy unit suffers D6 mortal wounds."
}

ork_model_abilities["Shokkjump Dragsta"] = {
    name: "Shokk Tunnel",
    rule: "Each time this model is selected to Advance, you can remove it from the battlefield and set it up again anywhere on the battlefield that is more than 9\" horizontally 
        away from all enemy models instead of making an Advance move (this model is still considered to have Advanced this turn)."
}

ork_model_abilities["Squighog Boyz - Nob on Smasha Squig"] = {
    name: "Wild Ride",
    rule: "You can ignore any or all modifiers to this unit’s Move characteristic and to Advance and Charge rolls made for this unit."
}

ork_model_abilities["Squighog Boyz - Squighog Boy"] = {
    name: "Wild Ride",
    rule: "You can ignore any or all modifiers to this unit’s Move characteristic and to Advance and Charge rolls made for this unit."
}

ork_model_abilities["Stompa"] = {
    name: "Waaagh! Effigy (Aura)",
    rule: "While a friendly ORKS unit is within 12\" of this model, each time you take a Battle-shock test for that unit, add 1 to that test."
}

ork_model_abilities["Stompa"] = {
    name: "Stompin’ Forward",
    rule: "Each time this model makes a Normal, Advance or Fall Back move, it can move over models (excluding TITANIC models) and terrain 
        features that are 4\" or less in height as if they were not there."
}

ork_model_abilities["Stormboy - Boss Nob"] = {
    name: "Full Throttle",
    rule: "This unit is eligible to declare a charge in a turn in which it Advanced or Fell Back."
}

ork_model_abilities["Stormboy - Stormboy"] = {
    name: "Full Throttle",
    rule: "This unit is eligible to declare a charge in a turn in which it Advanced or Fell Back."
}

ork_model_abilities["Tankbustas - Boss Nob"] = {
    name: "Tank Hunters",
    rule: "Each time a model in this unit makes a ranged attack that targets a MONSTER or VEHICLE unit, add 1 to the Hit roll and add 1 to the Wound roll."
}

ork_model_abilities["Tankbustas - Boss Nob"] = {
    name: "Bomb Squigs",
    rule: "Twice per battle, after this unit ends a Normal move, you can use one Bomb Squig. If you do, select one enemy unit within 12\" and visible to 
        this unit and roll one D6: on a 3+, that enemy unit suffers D3 mortal wounds."
}

ork_model_abilities["Tankbustas - Tankbusta"] = {
    name: "Tank Hunters",
    rule: "Each time a model in this unit makes a ranged attack that targets a MONSTER or VEHICLE unit, add 1 to the Hit roll and add 1 to the Wound roll."
}

ork_model_abilities["Tankbustas - Tankbusta"] = {
    name: "Bomb Squigs",
    rule: "Twice per battle, after this unit ends a Normal move, you can use one Bomb Squig. If you do, select one enemy unit within 12\" and visible to 
        this unit and roll one D6: on a 3+, that enemy unit suffers D3 mortal wounds."
}

ork_model_abilities["Trukk"] = {
    name: "Grot Riggers",
    rule: "At the start of your Command phase, this model regains 1 lost wound."
}

ork_model_abilities["Warbikers - Boss Nob on Warbike"] = {
    name: "Drive-by Dakka",
    rule: "Each time a model in this unit makes a ranged attack that targets a unit within 9\", improve the Armour Penetration characteristic of that attack by 1."
}

ork_model_abilities["Warbikers - Warbiker"] = {
    name: "Drive-by Dakka",
    rule: "Each time a model in this unit makes a ranged attack that targets a unit within 9\", improve the Armour Penetration characteristic of that attack by 1."
}

ork_model_abilities["Warboss"] = {
    name: "Might is Right",
    rule: "While this model is leading a unit, each time a model in that unit makes a melee attack, add 1 to the Hit roll."
}

ork_model_abilities["Warboss"] = {
    name: "Da Biggest and da Best",
    rule: "While the Waaagh! is active for your army, add 4 to the Attacks characteristic of this model’s melee weapons."
}

ork_model_abilities["Warboss In Mega Armour"] = {
    name: "Might is Right",
    rule: "While this model is leading a unit, each time a model in that unit makes a melee attack, add 1 to the Hit roll."
}

ork_model_abilities["Warboss In Mega Armour"] = {
    name: "Dead Brutal",
    rule: "While the Waaagh! is active for your army, this model’s ’uge choppa has a Damage characteristic of 3."
}

ork_model_abilities["Wazbom Blastajet"] = {
    name: "Blastajet Attack Run",
    rule: "Each time this model makes a ranged attack that targets a unit that cannot FLY, re-roll a Hit roll of 1."
}

ork_model_abilities["Weirdboy"] = {
    name: "Waaagh! Energy",
    rule: "While this model is leading a unit, add 1 to the Strength and Damage characteristics of this model’s ’Eadbanger 
        weapon for every 5 models in that unit (rounding down), but while that unit contains 10 or more models, that weapon has the [HAZARDOUS] ability."
}

ork_model_abilities["Weirdboy"] = {
    name: "Da Jump (Psychic)",
    rule: "Once per turn, at the end of your Movement phase, one WEIRDBOY from your army can use this ability. If it does, roll one D6: on a 1, that WEIRDBOY’s 
        unit suffers D6 mortal wounds; on a 2+, remove this WEIRDBOY’s unit from the battlefield and set it up again anywhere on the battlefield that is more than 9\" 
        horizontally away from all enemy models."
}

ork_model_abilities["Wurrboy"] = {
    name: "Unstable Oracle",
    rule: "While this model is leading a unit, add 2 to the Attacks characteristic of this model’s Eyez of Mork weapon for every 5 models in that unit (rounding down), 
        but while that unit contains 10 or more models, that weapon has the [HAZARDOUS] ability."
}

ork_model_abilities["Wurrboy"] = {
    name: "Roar of Mork (Psychic)",
    rule: "In your opponent’s Command phase, you can select one enemy unit within 18\" ofand visible to this PSYKER and roll one D6: on a 1, this PSYKER’s unit suffers 
        D3 mortal wounds; on a 2+, until the start of your opponent’s next Command phase, that enemy unit is confrazzled. While a unit is confrazzled, each time a 
        Battle-shock or Leadership test is taken for it, subtract 2 from that test."
}

ork_model_abilities["Zodgrod Wortsnagga"] = {
    name: "Super Runts",
    rule: "While this model is leading a unit:
        Models in that unit have the Scouts 9\" ability.
        Each time a model in that unit makes an attack, add 1 to the Hit roll and add 1 to the Wound roll.
        Each time an attack targets that unit, subtract 1 from the Wound roll."
}

ork_model_abilities["Zodgrod Wortsnagga"] = {
    name: "Special Dose",
    rule: "While the Waaagh! is active for your army, add 6\" to the Move characteristic of models in this model’s unit."
}

create_ork_model_abilities(ork_model_abilities)

puts "Created Ork model abilities successfully."