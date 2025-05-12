
puts "Creating users..."

def create_users(user_data)
  user_data.each do |data|
    User.create!(
      username: data[:username],
      email: data[:email],
      password: data[:password]
    )
  end
end

users = [
  { username: "FirstZion", email: "dustinjonadler@gmail.com", password: "Password123!" },
  { username: "SecondZion", email: "dustin.adler@yahoo.com", password: "Password123!" },
  { username: "ThirdZion", email: "adler.dustin@yahoo.com", password: "Password123!" }
]

create_users(users)

puts "Users created successfully!"
