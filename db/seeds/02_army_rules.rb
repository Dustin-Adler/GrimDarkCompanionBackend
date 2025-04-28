puts "Creating army rules..."

def create_army_abilities(army_abilities)
    army_abilities.each do |army_name, army_ability_data|
        Ability.create({
            name: army_ability_data[:name],
            flavour_text: army_ability_data[:flavour_text],
            rule: army_ability_data[:rule],
            example: army_ability_data[:example],
            tldr: army_ability_data[:tldr],
            ability_type: "ARMY",
            army_id: $grim_dark_armies[army_name].id
        })
    end
end

army_abilities = {}
army_abilities["Orks"] = {
        name: "Whaaagh!",
        flavour_text: "The infamous war cry of the Orks is known and feared throughout the galaxy. When it echoes across the battlefield, bellowed from hundreds or even thousands of greenskin mouths, even the most stalwart warriors fear the onslaught to come.",
        rule: "If your Army Faction is ORKS, once per battle, at the start of your Command phase, you can call a Waaagh!. If you do, until the start of your next Command phase, the Waaagh! is active for your army and:
            Units from your army with this ability are eligible to declare a charge in a turn in which they Advanced.
            Add 1 to the Strength and Attacks characteristics of melee weapons equipped by models from your army with this ability.
            Models from your army with this ability have a 5+ invulnerable save.",
        tldr: "Once per battle, for one battle round, all units. Advance and charge. +1 to Strength and Attacks of melee weapons. Gain 5+ invuln save."
}

create_army_abilities(army_abilities)

puts "Army rules created successfully."