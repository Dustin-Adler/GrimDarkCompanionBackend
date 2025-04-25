# class CreateAbilities < ActiveRecord::Migration[8.0]
#     def change
#       create_table :abilities do |t|
#         t.string :name, null: false
#         t.text :description, null: false
#         t.text :rule, null: false
#         t.text :example, null: false
#         t.string :tldr, null: false
  
#         t.timestamps
#       end
#     end
#   end

core_abilities = {
    "Deep Strike" => {
        name: "Deep Strike",
        description: "Some units make their way to battle via tunnelling, teleportation, high-altitude descent or other extraordinary means that allow them to appear suddenly in the thick of the fighting.",
        rule: "During the Declare Battle Formations step, if every model in a unit has this ability, you can set it up in Reserves instead of setting it up on the battlefield. If you do, in the Reinforcements step of one of your Movement phases you can set up this unit anywhere on the battlefield that is more than 9\" horizontally away from all enemy models. If a unit with the Deep Strike ability arrives from Strategic Reserves, the controlling player can choose for that unit to be set up either using the rules for Strategic Reserves or using the Deep Strike ability.",
        example: "n/a",
        tldr: "Set up in Reserves. In Reinforcements step, set up anywhere more than 9\" away from enemy models."
    },
    "Infiltrate" => {
        name: "Infiltrate",
        description: "Many armies employ reconnaissance units who can sit concealed, waiting for the right moment to strike.",
        rule: "During deployment, if every model in a unit has this ability, then when you set it up, it can be set up anywhere on the battlefield that is more than 9\" horizontally away from the enemy deployment zone and all enemy models.",
        example: "n/a",
        tldr: "During deployment, up anywhere more than 9\" away from enemy models and deployment zone.",
    },
    "Stealth" => {
        name: "Stealth",
        description: "Some units are able to conceal themselves from enemy sight, making them harder to target.",
        rule: "If every model in a unit has this ability, then each time a ranged attack is made against it, subtract 1 from that attack’s Hit roll.",
        example: "n/a",
        tldr: "-1 to hit from ranged attacks against this unit."
    },
    "Feel No Pain" => {
        name: "Feel No Pain",
        description: "Some warriors refuse to be laid low, even by what should be fatal wounds.",
        rule: "Some models have ‘Feel No Pain x+’ listed in their abilities. Each time a model with this ability suffers damage and so would lose a wound 
            (including wounds lost due to mortal wounds), roll one D6: if the result is greater than or equal to the number denoted by ‘x’, that wound is ignored and is not lost. 
            If a model has more than one Feel No Pain ability, you can only use one of those abilities each time that model suffers damage and so would lose a wound.",
        example: "If a model takes a wound for 3 damage, roll 1 d6 for each point of damage from that wound. ingnore y damage, where y is number of dice that rolled equal to or greater than the model's feel no pain x.",
        tldr: "Roll D6 when model suffers damage. If result is greater than or equal to x, ignore wound."
    },
    "Leader" => {
        name: "Leader",
        description: "Mighty heroes fight at the forefront of battle.",
        rule: "Some CHARACTER units have ‘Leader’ listed on their datasheets. Such CHARACTER units are known as Leaders, and the units they can lead – known as their Bodyguard units – are listed on their datasheet.
            During the Declare Battle Formations step, for each Leader in your army, if your army also includes one or more of that Leader’s Bodyguard units, you can select one of those Bodyguard units. That Leader will then attach to that Bodyguard unit for the duration of the battle and is said to be leading that unit. Each Bodyguard unit can only have one Leader attached to it.
            While a Bodyguard unit contains a Leader, it is known as an Attached unit and, with the exception of rules that are triggered when units are destroyed, it is treated as a single unit for all rules purposes. Each time an attack targets an Attached unit, until the attacking unit has resolved all of its attacks, you must use the Toughness characteristic of the Bodyguard models in that unit, even if a Leader in that unit has a different Toughness characteristic. Each time an attack sucessfully wounds an Attached unit, that attack cannot be allocated to a CHARACTER model in that unit, even if that CHARACTER model has lost one or more wounds or has already had attacks allocated to it this phase. As soon as the last Bodyguard model in an Attached unit has been destroyed, any attacks made against that unit that have yet to be allocated can then be allocated to CHARACTER models in that unit.
            Each time the last model in a Bodyguard unit is destroyed, each CHARACTER unit that is part of that Attached unit is no longer part of an Attached unit. It becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks.
            Each time the last model in a CHARACTER unit that is attached to a Bodyguard unit is destroyed and there is not another CHARACTER unit attached, that Attached unit’s Bodyguard unit is no longer part of an Attached unit. It becomes a separate unit, with its original Starting Strength. If this happens as the result of an attack, they become separate units after the attacking unit has resolved all of its attacks.
            Each time a unit that is part of an Attached unit is destroyed, it does not have the keywords of any other units that make up that Attached unit (unless it has those keywords on its own datasheet) for the purposes of any rules that would be triggered when that unit is destroyed.",
        example: "Example: If you only destroy the Bodyguard unit that is part of an Attached unit, you have not destroyed a CHARACTER unit. If you only destroy the CHARACTER unit that is part of an Attached unit, or if you destroy the whole Attached unit, you have destroyed one CHARACTER unit."
        tldr: "Before the battle, CHARACTER units with the Leader ability can be attached to one of their Bodyguard units to form an Attached unit. Attached units can only contain one Leader. Attacks cannot be allocated to CHARACTER models in Attached units."
    },
}