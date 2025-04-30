puts "Creating weapon abilities..."

def create_weapon_abilities(weapon_abilities)
    weapon_abilities.each do |ability_name, ability_data|
        Ability.create({
            name: ability_data[:name],
            flavour_text: ability_data[:flavour_text],
            rule: ability_data[:rule],
            example: ability_data[:example],
            tldr: ability_data[:tldr],
            ability_type: "WEAPON"
        })
    end
end

weapon_abilities = {}
weapon_abilities["Assault"] = {
    name: "Assault",
    flavour_text: "Assault weapons fire so indiscriminately that they can be shot from the hip as warriors dash forward.",
    rule: "If a unit that Advanced this turn contains any models equipped with Assault weapons, it is still eligible to shoot in this turn’s Shooting phase. 
        When such a unit is selected to shoot, you can only resolve attacks using Assault weapons its models are equipped with. ",
    tldr: "Can be shot even if the bearer’s unit Advanced."
}

weapon_abilities["Rapid Fire"] = {
    name: "Rapid Fire",
    flavour_text: "Rapid fire weapons are capable of long-ranged precision shots or controlled bursts at nearby targets.",
    rule: "Each time such a weapon targets a unit within half that weapon’s range, the Attacks characteristic of that weapon is increased by the amount denoted by ‘x’.",
    example: "A model targets a unit that is within half range of a weapon with an Attacks characteristic of 1 and the [RAPID FIRE 1] ability. That weapon therefore makes two attacks at the target, and you make two Hit rolls.",
    tldr: "Increase the Attacks by ‘x’ when targeting units within half range."
}

weapon_abilities["Ignores Cover"] = {
    name: "Ignores Cover",
    flavour_text: "Some weapons are designed to root enemy formations out of entrenched positions.",
    rule: "Each time an attack is made with such a weapon, the target cannot have the Benefit of Cover against that attack.",
    tldr: "Targets cannot benefit from cover against \"Ignores Cover\" weapons."
}

weapon_abilities["Twin Linked"] = {
    name: "Twin Linked",
    flavour_text: "Dual weapons are often grafted to the same targeting system for greater lethality.",
    rule: "Each time an attack is made with such a weapon, you can re-roll that attack’s Wound roll.",
    tldr: "Can re-roll the Wounds from these weapons."
}

weapon_abilities["Pistol"] = {
    name: "Pistol",
    flavour_text: "Pistols can be wielded even at point-blank range.",
    rule: " If a unit contains any models equipped with Pistols, that unit is eligible to shoot in its controlling player’s Shooting phase even while it is within Engagement Range 
        of one or more enemy units. When such a unit is selected to shoot, it can only resolve attacks using its Pistols and can only target one of the enemy units it is within Engagement Range of. 
        In such circumstances, a Pistol can target an enemy unit even if other friendly units are within Engagement Range of the same enemy unit.
        
        If a model is equipped with one or more Pistols, unless it is a Monster or Vehicle model, it can either shoot with its Pistols or with all of its other ranged weapons. 
        Declare whether such a model will shoot with its Pistols or its other ranged weapons before selecting targets.",
    tldr: "Can be shot even if the bearer’s unit is within Engagement Range of enemy units, but must target one of those enemy units. 
        Cannot be shot alongside any other non-Pistol weapon (except by a Monster or Vehicle)."
}

weapon_abilities["Torrent"] = {
    name: "Torrent",
    flavour_text: "Torrent weapons shoot clouds of fire, gas or other lethal substances that few foes can hope to evade.",
    rule: "Each time an attack is made with such a weapon, that attack automatically hits the target.",
    tldr: "Auto-Succeed hit all hit rolls"
}

weapon_abilities["Lethal Hits"] = {
    name: "Lethal Hits",
    flavour_text: "Some weapons can inflict fatal injuries on any foe, no matter their resilience.",
    rule: "Each time an attack is made with such a weapon, a Critical Hit automatically wounds the target.",
    tldr: "Critical hit rolls Auto-Succeed wound roll"
}

weapon_abilities["Lance"] = {
    name: "Lance",
    flavour_text: "Lance weapons are deadly on the charge.",
    rule: "Each time an attack is made with such a weapon, if the bearer made a Charge move this turn, add 1 to that attack’s Wound roll.",
    tldr: "+1 to Wound rolls after successful charge."
}

weapon_abilities["Indirect Fire"] = {
    name: "Indirect Fire",
    flavour_text: "Indirect fire weapons launch munitions over or around intervening obstacles – nowhere is safe from their fury.",
    rule: "Weapons with [INDIRECT FIRE] in their profile are known as Indirect Fire weapons, and attacks can be made with them even if the target is not visible to the attacking model. 
        These attacks can destroy enemy models in a target unit even though none may have been visible to the attacking unit when you selected that target.
        
        If no models in a target unit are visible to the attacking unit when you select that target, then each time a model in the attacking unit makes an attack against that target using an Indirect Fire weapon, 
        subtract 1 from that attack’s Hit roll and the target has the Benefit of Cover against that attack",
    example: "An enemy unit is targeted by an attacking model equipped with a weapon with the [INDIRECT FIRE] ability. No models in the target unit are visible to the attacking model, 
        so when resolving the attacks made with that weapon, subtract 1 from that attack’s Hit roll and each time an attack is allocated to a model in the target unit, it has the Benefit of Cover against that attack.",
    tldr: "Can attack targets w/o LoS, but -1 to hit and target has the Benefit of Cover."
}

weapon_abilities["Blast"] = {
    name: "Blast",
    flavour_text: "High-explosives can fell several warriors in a single blast, but firing them where your comrades will get caught in the ensuing detonation is simply unwise.",
    rule: "Each time you determine how many attacks are made with a Blast weapon, add 1 to the result for every five models that were in the target unit when you selected it as the target (rounding down). 
        Blast weapons can never be used to make attacks against a unit that is within Engagement Range of one or more units from the attacking model’s army (including its own unit).",
    example: "If a weapon with the [BLAST] ability and an Attacks characteristic of 2D6 targets a unit that contains 11 models, and the roll to determine how many attacks are made is a 9, 
        a total of 11 attacks would be made against that unit.",
    tldr: "+1 to the Attack per five models in target unit (round down). Can't be used against a target that is within Engagement Range of allies (including itself)."
}

weapon_abilities["Melta"] = {
    name: "Melta",
    flavour_text: "Melta weapons are powerful heat rays whose fury is magnified at close range.",
    rule: "Each time an attack made with such a weapon targets a unit within half that weapon’s range, that attack’s Damage characteristic is increased by the amount denoted by ‘x’.",
    example: "A model targets a unit that is within half range of a weapon with a Damage characteristic of D6 and the [MELTA 2] ability. If that attack inflicts damage on the target, it inflicts D6+2 damage.",
    tldr: "+‘x’ damage when targeting units within half range."
}

weapon_abilities["Precision"] = {
    name: "Precision",
    flavour_text: "Precision attacks can pick high-value targets out in a crowd, whether through the unerring aim of a sniper or the pinpoint accuracy of a blade-master’s strike.",
    rule: "Each time an attack made with such a weapon successfully wounds an Attached unit (pg 39), if a Character model in that unit is visible to the attacking model, 
        the attacking model’s player can choose to have that attack allocated to that Character model instead of following the normal attack sequence.",
    tldr: "Player can choose to wound Character instead of bodygaurds"
}

weapon_abilities["Heavy"] = {
    name: "Heavy",
    flavour_text: "Heavy weapons are amongst the biggest guns on the battlefield, but require bracing to fire at full effect and are unwieldy to bring to bear at close quarters.",
    rule: "Each time an attack is made with such a weapon, if the attacking model’s unit Remained Stationary this turn, add 1 to that attack’s Hit roll.",
    tldr: "+1 to hit if unit didn't move."
}

weapon_abilities["Sustained Hits"] = {
    name: "Sustained Hits",
    flavour_text: "Some weapons strike in a flurry of blows, tearing the foe apart with relentless ferocity.",
    rule: "Each time an attack is made with such a weapon, if a Critical Hit is rolled, that attack scores a number of additional hits on the target as denoted by ‘x’.",
    example: "A model makes an attack with a melee weapon with the [SUSTAINED HITS 2] ability. If the Hit roll is an unmodified 6 (a Critical Hit), then that attack scores a total of 3 hits on the target 
        (1 from the successful Hit roll of 6, and 2 from the [SUSTAINED HITS 2] ability).",
    tldr: "Critical Hits score ‘x’ additional hits."
}

weapon_abilities["Hazardous"] = {
    name: "Hazardous",
    flavour_text: "Weapons powered by unstable and dangerous energy sources pose a substantial risk to the wielder every time they are used.",
    rule: "Each time a unit is selected to shoot or fight, if one or more models attack with Hazardous weapons, then after that unit has resolved all of its attacks, you must take one Hazardous test 
        for each Hazardous weapon that was just used by rolling one D6. For each roll of 1, that test is failed and one model in that unit equipped with a Hazardous weapon is destroyed 
        (selected by the controlling player), unless that model is a Character, Monster or Vehicle, in which case it suffers 3 mortal wounds instead. Note that if you selected a Character model in an Attached unit, 
        the mortal wounds suffered must be allocated to that model f irst, even if there is another model in that unit that has lost one or more wounds or has had attacks allocated to it this phase.",
    example: "A unit of five models make five attacks with ranged weapons with the [HAZARDOUS] ability. After the unit has finished shooting, its controlling player rolls five D6. 
        One of the results is a 1, and as no models in the unit are Characters, Monsters or Vehicles, one of those models is destroyed.",
    tldr: "Roll d6 for each Hazardous weapon. Each 1 rolled 1 model is lost. Characters, Monsters and Vehicles take 3 woulds instead."
}

weapon_abilities["Extra Attacks"] = {
    name: "Extra Attacks",
    flavour_text: "Some warriors ride to battle atop trusty mounts that gore and trample nearby foes. Others wield combat weapons that deliver a frenzy of additional blows.",
    rule: "Each time the bearer of such a weapon fights, it can make attacks with that weapon in addition to the one it chooses to fight with. 
        The number of attacks made with an Extra Attacks weapon cannot be modified by other rules.",
    tldr: "Can attack alongside chosen weapon. Number of attacks cannot be modified."
}

weapon_abilities["Devastating Wounds"] = {
    name: "Devastating Wounds",
    flavour_text: "Some weapons can inflict strikes of such power that they make a mockery of armour and can cleave through several foes.",
    rule: "Each time an attack is made with such a weapon, a Critical Wound inflicts a number of mortal wounds on the target equal to the Damage characteristic of that weapon and the attack sequence ends.",
    example: "An attack made with a Devastating Wounds weapon with a Damage characteristic of 2 scores a Critical Wound. Instead of allocating the attack and making saving throws normally, the target suffers 2 mortal wounds.",
    tldr: "Critical wounds Auto-Fail oppenent's saving throws."
}

weapon_abilities["Anti"] = {
    name: "Anti",
    flavour_text: "Certain weapons are the bane of a particular foe.",
    rule: "Each time an attack is made with such a weapon against a target with the keyword after the word ‘Anti-’, an unmodified Wound roll of ‘x+’ scores a Critical Wound.",
    example: "An attack made with an [ANTI-VEHICLE 4+] weapon will score a Critical Wound against – and so successfully wound – a Vehicle unit on an unmodified Wound roll of 4+, 
        while an attack made with an [ANTI-PSYKER 2+] weapon will score a Critical Wound against – and so successfully wound – a Psyker unit on an unmodified Wound roll of 2+.",
    tldr: "Lowers threshold for Critical Wounds against ‘keyword’ target to ‘x’."
}

create_weapon_abilities(weapon_abilities)

puts "Created weapon abilities successfully"
