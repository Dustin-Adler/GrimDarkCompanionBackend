
any_users = User.first
any_armies = Army.first
any_abilities = Ability.first
any_models = Model.first
any_weapons = Weapon.first

if any_users
    User.destroy_all
end

if any_armies
    Army.destroy_all
end

if any_abilities
    Ability.destroy_all
end

if any_models
    Model.destroy_all
end

if any_weapons
    Weapon.destroy_all
end

Dir[File.join(Rails.root, "db", "seeds", "*.rb")].sort.each do |seed|

    puts "seeding - #{seed}"

    load seed
end
