puts "creating Ork wargear, damage, and transport abilities..."

def create_ork_model_abilities(ork_wargear_abilities)
    ork_wargear_abilities.each do |model_name, ability_data|
        puts "Failed to create wargear abilities for #{model_name}" unless $ork_models[model_name]

        weapon_id = nil
        model_id = nil
        if ability_data[:ability_type] == "WARGEAR"
            weapon_id = $orks_models_and_weapons[model_name].select { |weapon| weapon.name == ability_data[:name] }[0].id
        else
            model_id = $ork_models[model_name].id
        end

        Ability.create({
            name: ability_data[:name],
            rule: ability_data[:rule],
            example: ability_data[:example],
            wargear_id: weapon_id,
            model_id: model_id,
            ability_type: ability_data[:ability_type]
        })
    end
end

ork_wargear_abilities = {}

ork_wargear_abilities["Big Mek In Mega Armour"] = {
    name: "Kustom Force Field",
    flavour_text: "Gatha' up ladz! We's bubble boyz now!",
    rule: "While the bearer is leading a unit, models in that unit have a 4+ invulnerable save against ranged attacks.",
    tldr: "Leader gives 4+ invuln save to unit.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Big Mek In Mega Armour"] = {
    name: "Grot Oiler",
    flavour_text: "Grotz are da bestest at fixin' stuff.",
    rule: "Once per battle, at the end of your Movement phase, one model in the bearer’s unit
        regains D3 lost wounds.",
    example: "Use a cool little grot model to represent the oiler.",
    tldr: "One model in unit regains D3 wounds once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Big Mek With Shokk Attack Gun"] = {
    name: "Grot Assistant",
    flavour_text: "Let me fix dat for ya, boss!",
    rule: "Once per battle, after rolling to determine how many attacks the bearer’s
        shokk attack gun makes, you can re-roll that dice.",
    example: "Use a cool little grot model to represent the assistant.",
    tldr: "Re-roll attack dice once a game for the shokk attack gun.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Painboss"] = {
    name: "Grot Orderly",
    flavour_text: "Oi! Get back up! We's not done yet!",
    rule: "Once per battle, in your Command phase, if the bearer is leading a unit that is below
        its Starting Strength, you can return up to D3 destroyed Bodyguard models to that unit.",
    example: "Use a cool little grot model to represent the orderly.",
    tldr: "Return D3 Bodyguard models to lead unit once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Boyz - Boy"] = {
    name: "Bodyguard",
    flavour_text: "Get anotha' boss!",
    rule: "If this unit has a Starting Strength of 20, you can attach up to two Leader units
        to it instead of one (but only if one of those is a WARBOSS model). If you do, and this unit is destroyed,
        the Leader units attached to it become separate units with their original Starting Strengths.",
    tldr: "One Warboss and One other leader can be attached to a unit of 20 Boyz.",
    ability_type: "BODYGUARD"
}

ork_wargear_abilities["Trukk"] = {
    name: "Transport",
    flavour_text: "Get in, ladz!",
    rule: "This model has a transport capacity of 12 ORKS INFANTRY models. Each MEGA ARMOUR
        model takes up the space of 2 models. It cannot transport JUMP PACK or GHAZGHKULL THRAKA models.",
    example: "Jump out the front and charge! While others advance backwards into the truck to get away.",
    tldr: "Carries 12 little boyz or 6 mega armoured/jumpy boyz.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Big’ed Bossbunka"] = {
    name: "Transport",
    flavour_text: "Get in, again!",
    rule: "This model has a transport capacity of 11 ORKS INFANTRY models (excluding GHAZGHKULL THRAKA).
        Each MEGA ARMOUR or JUMP PACK model takes up the space of 2 models.",
    tldr: "Carries 12 little boyz or 6 mega armoured/jumpy boyz.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Battlewagon"] = {
    name: "Transport",
    flavour_text: "Bigger truck for bigger gitz!",
    rule: "This model has a transport capacity of 22 ORKS INFANTRY models. If this model is equipped with a
        killkannon, it has a transport capacity of 12 ORKS INFANTRY models. Each MEGA ARMOUR or JUMP PACK model takes
        up the space of 2 models. The GHAZGHKULL THRAKA model takes up the space of 15 models but can only embark within
        this model if this model is not equipped with an ’ard case, kannon, killkannon or zzap gun.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Blitza-bommer"] = {
    name: "Damaged: 1-4 wounds remaining",
    rule: "While this model has 1-4 wounds remaining, each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Dakkajet"] = {
    name: "Damaged: 1-4 wounds remaining",
    rule: "While this model has 1-4 wounds remaining, each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Flash Gitz"] = {
    name: "Ammo Runt",
    flavour_text: "Oi! Get me some more ammo!",
    rule: "Once per battle, when this unit is selected to shoot, it can use this ability. If it does, until the end of the phase,
        ranged weapons equipped by models in this unit have the [LETHAL HITS] ability.",
    example: "Use a cool little grot model to represent the ammo runt.",
    tldr: "Ranged weapons get LETHAL HITS once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Gorkanaut"] = {
    name: "Damaged: 1-7 wounds remaining",
    rule: "While this model has 1-7 wounds remaining, subtract 4 from this model’s Objective Control characteristic,
        and each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Gorkanaut"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 12 ORKS INFANTRY models (excluding GHAZGHKULL THRAKA). Each MEGA ARMOUR or
        JUMP PACK model takes up the space of 2 models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Morkanaut"] = {
    name: "Damaged: 1-7 wounds remaining",
    rule: "While this model has 1-7 wounds remaining, subtract 4 from this model’s
        Objective Control characteristic, and each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Morkanaut"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 12 ORKS INFANTRY models (excluding GHAZGHKULL THRAKA). Each MEGA ARMOUR or
        JUMP PACK model takes up the space of 2 models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Hunta Rig"] = {
    name: "Damaged: 1-5 wounds remaining",
    rule: "While this model has 1-5 wounds remaining, each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Hunta Rig"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 21 BEAST SNAGGA INFANTRY models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Kill Rig"] = {
    name: "Damaged: 1-5 wounds remaining",
    rule: "While this model has 1-5 wounds remaining, each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Kill Rig"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 11 BEAST SNAGGA INFANTRY models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Kommandos - Kommando"] = {
    name: "Distraction Grot",
    flavour_text: "Betch ya can't hit me!",
    rule: "Once per battle, in your opponent’s Shooting phase, before making a saving throw for a model in this unit,
        it can deploy the distraction grot. If it does, until the end of the phase, models in this unit have a 5+ invulnerable save.",
    example: "Use a cool little grot model to represent the Distraction Grot.",
    tldr: "5+ invuln save against ranged attacks once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Kommandos - Kommando"] = {
    name: "Bomb Squig",
    flavour_text: "Good boi! Go get 'em! Hyah! Stoopid squig.",
    rule: "Once per battle, after this unit ends a Normal move, select one enemy unit
        within 12\" of this unit and roll one D6: on a 2+, that enemy unit suffers D3 mortal wounds.",
    example: "Use a bestest little squig model to represent the Bomb Squig.",
    tldr: "D3 mortal wounds on a 2+ to a unit within 12\" once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Nobz"] = {
    name: "Ammo Runt",
    flavour_text: "Oi! Get me some more ammo!",
    rule: "Once per battle, when this unit is selected to shoot, it can use this ability. If it does, until the end of the phase,
        ranged weapons equipped by models in this unit have the [LETHAL HITS] ability.",
    example: "Use a cool little grot model to represent the Ammo Runt.",
    tldr: "Ranged weapons get LETHAL HITS once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Squighog Boyz - Squighog Boy"] = {
    name: "Bomb Squig",
    flavour_text: "Good boi! Go get 'em! Hyah! Stoopid squig.",
    rule: "Once per battle for each bomb squig this unit has, after this unit ends a Normal move, you can select one enemy unit within
        12\" of it and roll one D6: on a 2+, that enemy unit suffers D3 mortal wounds.",
    example: "Use a bestest little squig model to represent the Bomb Squig.",
    tldr: "D3 mortal wounds on a 2+ to a unit within 12\" once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Stompa"] = {
    name: "Damaged: 1-10 wounds remaining",
    rule: "While this model has 1-10 wounds remaining, subtract 6 from this model’s
        Objective Control characteristic and each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Stompa"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 22 ORKS INFANTRY models. Each MEGA ARMOUR or JUMP PACK
        model takes up the space of 2 models. The GHAZGHKULL THRAKA model takes up the space of 15 models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Wazbom Blastajet"] = {
    name: "Damaged: 1-4 wounds remaining",
    rule: "While this model has 1-4 wounds remaining, each time this model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Tankbustas - Tankbusta"] = {
    name: "Pulsa Rokkit",
    flavour_text: "Dat's a big boom!",
    rule: "Once per battle, when the bearer’s unit is selected to shoot in your Shooting phase, the bearer can use its pulsa rokkit.
        If it does, until the end of the phase, improve the Strength and Armour Penetration characteristics of ranged weapons equipped
        by models in the bearer’s unit by 1.",
    tldr: "Ranged weapons get +1 Strength and AP once per game.",
    ability_type: "WARGEAR"
}

ork_wargear_abilities["Gargantuan Squiggoth"] = {
    name: "Damaged: 1-10 wounds remaining",
    rule: "While this model has 1-10 wounds remaining, subtract 6 from this model’s Objective Control characteristic and each time this
        model makes an attack, subtract 1 from the Hit roll.",
    ability_type: "DAMAGED"
}

ork_wargear_abilities["Gargantuan Squiggoth"] = {
    name: "Transport",
    rule: "This model has a transport capacity of 20 ORKS INFANTRY models. Each MEGA ARMOUR or JUMP PACK model takes up the space of 2 models.
        GHAZGHKULL THRAKA takes up the space of 18 models. If this model is equipped with a supa-kannon, it has a transport capacity of 15 ORKS INFANTRY models.",
    ability_type: "TRANSPORT"
}

ork_wargear_abilities["Ghazghkull Thraka"] = {
    name: "Supreme Commander",
    rule: "If this unit is in your army, its Ghazghkull Thraka model must be your Warlord.",
    ability_type: "COMMANDER"
}

create_ork_model_abilities(ork_wargear_abilities)

puts "Successfully created Ork wargear abilities."
