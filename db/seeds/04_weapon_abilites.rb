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

puts "Creating weapon abilities..."

def create_weapon_abilities(weapon_abilities)
    weapon_abilities.each do |ability_name, ability_data|
        Ability.create({
            name: ability_data[:name],
            description: ability_data[:description],
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
    description: "Assault weapons fire so indiscriminately that they can be shot from the hip as warriors dash forward.",
    rule: "If a unit that Advanced this turn contains any models equipped with Assault weapons, it is still eligible to shoot in this turn’s Shooting phase. 
        When such a unit is selected to shoot, you can only resolve attacks using Assault weapons its models are equipped with. ",
    tldr: "Can be shot even if the bearer’s unit Advanced."
}

weapon_abilities["Rapid Fire"] = {
    name: "Rapid Fire",
    description: "Rapid fire weapons are capable of long-ranged precision shots or controlled bursts at nearby targets.",
    rule: "Each time such a weapon targets a unit within half that weapon’s range, the Attacks characteristic of that weapon is increased by the amount denoted by ‘x’.",
    example: "A model targets a unit that is within half range of a weapon with an Attacks characteristic of 1 and the [RAPID FIRE 1] ability. That weapon therefore makes two attacks at the target, and you make two Hit rolls.",
    tldr: "Increase the Attacks by ‘x’ when targeting units within half range."
}

create_weapon_abilities(weapon_abilities)

puts "Created weapon abilities successfully"