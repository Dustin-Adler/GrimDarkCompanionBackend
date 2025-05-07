
any_users = User.first
User.destroy_all if any_users

any_armies = Army.first
Army.destroy_all if any_armies

any_keywords = Keyword.first
Keyword.destroy_all if any_keywords

any_abilities = Ability.first
Ability.destroy_all if any_abilities

any_models = Model.first
Model.destroy_all if any_models

any_weapons = Weapon.first
Weapon.destroy_all if any_weapons

any_wargear_options = WargearOption.first
WargearOption.destroy_all if any_wargear_options

Dir[File.join(Rails.root, "db", "seeds", "*.rb")].sort.each do |seed|
    puts "seeding - #{seed}"

    load seed
end
