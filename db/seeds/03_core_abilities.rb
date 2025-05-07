# class CreateAbilities < ActiveRecord::Migration[8.0]
#     def change
#       create_table :abilities do |t|
#         t.string :name, null: false
#         t.text :description, null: false
#         t.text :rule, null: false
#         t.text :example
#         t.text :tldr, null: false
#         t.string :ability_type, null: false
#         t.integer :model_id

#         t.timestamps
#       end
#       add_index :abilities, :name
#       add_index :abilities, :model_id
#       add_index :abilities, :ability_type
#     end
#   end

puts "Creating core abilities..."

def create_core_abilities(core_abilities)
    core_abilities.each do |ability_name, ability_data|
        Ability.create({
            name: ability_data[:name],
            flavour_text: ability_data[:flavour_text],
            rule: ability_data[:rule],
            example: ability_data[:example],
            tldr: ability_data[:tldr],
            ability_type: "CORE"
        })
    end
end

core_abilities = {}
core_abilities["Deep Strike"] = {
    name: "Deep Strike",
    flavour_text: "Some units make their way to battle via tunnelling, teleportation, high-altitude descent or other extraordinary means that allow them
        to appear suddenly in the thick of the fighting.",
    rule: "During the Declare Battle Formations step, if every model in a unit has this ability, you can set it up in Reserves instead of setting it up on the battlefield.
        If you do, in the Reinforcements step of one of your Movement phases you can set up this unit anywhere on the battlefield that is more than 9\"
        horizontally away from all enemy models. If a unit with the Deep Strike ability arrives from Strategic Reserves, the controlling player can choose
        for that unit to be set up either using the rules for Strategic Reserves or using the Deep Strike ability.",
    tldr: "Set up in Reserves. In Reinforcements step, set up anywhere more than 9\" away from enemy models."
}

core_abilities["Infiltrate"] = {
    name: "Infiltrate",
    flavour_text: "Many armies employ reconnaissance units who can sit concealed, waiting for the right moment to strike.",
    rule: "During deployment, if every model in a unit has this ability, then when you set it up, it can be set up anywhere on the battlefield that is more than 9\"
        horizontally away from the enemy deployment zone and all enemy models.",

    tldr: "During deployment, up anywhere more than 9\" away from enemy models and deployment zone."
}

core_abilities["Stealth"] = {
    name: "Stealth",
    flavour_text: "Some units are able to conceal themselves from enemy sight, making them harder to target.",
    rule: "If every model in a unit has this ability, then each time a ranged attack is made against it, subtract 1 from that attack’s Hit roll.",
    tldr: "-1 to hit from ranged attacks against this unit."
}

core_abilities["Feel No Pain"] = {
    name: "Feel No Pain",
    flavour_text: "Some warriors refuse to be laid low, even by what should be fatal wounds.",
    rule: "Some models have ‘Feel No Pain x+’ listed in their abilities. Each time a model with this ability suffers damage and so would lose a wound
        (including wounds lost due to mortal wounds), roll one D6: if the result is greater than or equal to the number denoted by ‘x’, that wound is ignored and is not lost.
        If a model has more than one Feel No Pain ability, you can only use one of those abilities each time that model suffers damage and so would lose a wound.",
    example: "If a model takes a wound for 3 damage, roll 1 d6 for each point of damage from that wound. ingnore y damage,
        where y is number of dice that rolled equal to or greater than the model's feel no pain x.",
    tldr: "Roll D6 when model suffers damage. If result is greater than or equal to x, ignore wound."
}

core_abilities["Leader"] = {
    name: "Leader",
    flavour_text: "Mighty heroes fight at the forefront of battle.",
    rule: "Some CHARACTER units have ‘Leader’ listed on their datasheets. Such CHARACTER units are known as Leaders, and the units they can lead – known
        as their Bodyguard units – are listed on their datasheet. During the Declare Battle Formations step, for each Leader in your army, if your army
        also includes one or more of that Leader’s Bodyguard units, you can select one of those Bodyguard units. That Leader will then attach to that Bodyguard
        unit for the duration of the battle and is said to be leading that unit. Each Bodyguard unit can only have one Leader attached to it.

        While a Bodyguard unit contains a Leader, it is known as an Attached unit and, with the exception of rules that are triggered when units are destroyed,
        it is treated as a single unit for all rules purposes. Each time an attack targets an Attached unit, until the attacking unit has resolved all of its attacks,
        you must use the Toughness characteristic of the Bodyguard models in that unit, even if a Leader in that unit has a different Toughness characteristic.
        Each time an attack sucessfully wounds an Attached unit, that attack cannot be allocated to a CHARACTER model in that unit,
        even if that CHARACTER model has lost one or more wounds or has already had attacks allocated to it this phase. As soon as the last Bodyguard model in an Attached
        unit has been destroyed, any attacks made against that unit that have yet to be allocated can then be allocated to CHARACTER models in that unit.

        Each time the last model in a Bodyguard unit is destroyed, each CHARACTER unit that is part of that Attached unit is no longer part of an Attached unit.
        It becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack,
        they become separate units after the attacking unit has resolved all of its attacks.

        Each time the last model in a CHARACTER unit that is attached to a Bodyguard unit is destroyed and there is not another CHARACTER unit attached,
        that Attached unit’s Bodyguard unit is no longer part of an Attached unit. It becomes a separate unit, with its original Starting Strength.
        If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks.

        Each time a unit that is part of an Attached unit is destroyed, it does not have the keywords of any other units that make up that
        Attached unit (unless it has those keywords on its own datasheet) for the purposes of any rules that would be triggered when that unit is destroyed.",
    example: "Example: If you only destroy the Bodyguard unit that is part of an Attached unit, you have not destroyed a CHARACTER unit.
        If you only destroy the CHARACTER unit that is part of an Attached unit, or if you destroy the whole Attached unit, you have destroyed one CHARACTER unit.",
    tldr: "Before the battle, CHARACTER units with the Leader ability can be attached to one of their Bodyguard units to form an Attached unit.
        Attached units can only contain one Leader. Attacks cannot be allocated to CHARACTER models in Attached units."
}

core_abilities["Lone Operative"] = {
    name: "Lone Operative",
    flavour_text: "Assassins and other covert agents are difficult to track and pinpoint in the swirling maelstrom of battle.",
    rule: "Unless part of an Attached unit (see Leader), this unit can only be selected as the target of a ranged attack if the attacking model is within 12\".",
    tldr: "Unless part of an Attached unit, this unit can only be selected as the target of a ranged attack if the attacking model is within 12\"."
}

core_abilities["Deadly Demise"] = {
    name: "Deadly Demise",
    flavour_text: "From detonating ammo stores to corrosive innards or frenzied death throes, some targets are deadly even in defeat.",
    rule: "Some models have ‘Deadly Demise x’ listed in their abilities. When such a model is destroyed, roll one D6 before removing it from play
        (if such a model is a TRANSPORT, roll before any embarked models disembark). On a 6, each unit within 6\" of that model suffers a number of mortal
        wounds denoted by ‘x’ (if this is a random number, roll separately for each unit within 6\").",
    example: "Example: A TRANSPORT model with the Deadly Demise D3 ability is destroyed. Before any models disembark and before removing it from play,
        its controlling player rolls one D6, getting a 6. There are three units within 6\" of that destroyed model, so its controlling player rolls one D3
        for each of them, inflicting mortal wounds accordingly.",
    tldr: "Deadly Demise x: When this model is destroyed, roll one D6. On a 6, each unit within 6\" suffers ‘x’ mortal wounds."
}

core_abilities["Scouts"] = {
    name: "Scouts",
    flavour_text: "Scouts form the vanguard of many armies. Unnoticed by the enemy, they range ahead of the main force.",
    rule: "Some units have ‘Scouts x\"’ listed in their abilities. If every model in a unit has this ability, then at the start of the first battle round,
        before the first turn begins, it can make a Normal move of up to x\", with the exception that, while making that move, the distance moved by each model in
        that unit can be greater than that model's Move characteristic, as long as it is not greater than x\".

        DEDICATED TRANSPORT models can make use of any Scouts x\" ability listed in their abilities, or a Scouts x\" ability that a unit that starts the battle embarked
        within that DEDICATED TRANSPORT model has (provided only models with this ability are embarked within that DEDICATED TRANSPORT model), regardless of how that
        embarked unit gained this ability (e.g. listed in their abilities, conferred by an Enhancement or by an attached CHARACTER, etc.).

        A unit that moves using this ability must end that move more than 9\" horizontally away from all enemy models. If both players have units that can do this,
        the player who is taking the first turn moves their units first.",
    example: "A unit has the Scouts 6\" ability. At the start of the first battle round, the controlling player can make a Normal move with that unit of up to 6\".",
    tldr: "Scouts x\": Unit can make a Normal move of up to x\" before the first turn begins.
        If embarked in a DEDICATED TRANSPORT, that DEDICATED TRANSPORT can make this move instead.
        Must end this move more than 9\" horizontally away from all enemy models."
}

core_abilities["Firing Deck"] = {
    name: "Firing Deck",
    flavour_text: "Some transports have firing hatches, ports or platforms from which embarked passengers can shoot.",
    rule: "Some TRANSPORT models have ‘Firing Deck x’ listed in their abilities. Each time such a model is selected to shoot in the Shooting phase,
        you can select up to ‘x’ models embarked within it whose units have not already shot this phase. Then, for each of those embarked models,
        you can select one ranged weapon that embarked model is equipped with (excluding weapons with the [ONE SHOT] ability). Until that TRANSPORT model
        has resolved all of its attacks, it counts as being equipped with all of the weapons you selected in this way, in addition to its other weapons.
        Until the end of the phase, those selected models’ units are not eligible to shoot.",
    tldr: "Each time this TRANSPORT shoots, select one weapon from up to ‘x’ models embarked whose units haven't shot this phase; those weapons are now equiped by this
        TRANSPORT until the end of the phase and can be used as if they were its own. Models whose weapons were used by a TRANSPORT are not eligible to shoot this phase."
}

core_abilities["Fights First"] = {
    name: "Fights First",
    flavour_text: "Some warriors attack with blinding speed, landing their blows before their foes can react.",
    rule: "Units with this ability that are eligible to fight do so in the Fights First step, provided every model in the unit has this ability.",
    tldr: "Hits first in Fight phase, even when not your turn."
}

create_core_abilities(core_abilities)

puts "Core abilities created successfully."
