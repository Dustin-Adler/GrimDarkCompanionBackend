
any_users = User.first

if any_users
    User.destroy_all
end

Dir[File.join(Rails.root, "db", "seeds", "*.rb")].sort.each do |seed|

    puts "seeding - #{seed}"

    load seed
end
