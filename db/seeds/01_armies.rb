puts "Creating armies..."

def create_armies(armies)
    armies.each do |army|
        Army.create({
            name: army[:name],
            description: army[:description],
            alliance: army[:alliance]
        })
    end
end

armies = []
armies << {
    name: "Orks",
    description: "The Orks are the most belligerent and resourceful race in the galaxy. Rampaging across the void in their billions,
        the greenskins devastate everything in their path with their ramshackle weapons and war machines,
        taking brutish glee in wanton destruction and revelling in warfare for its own sake.",
    alliance: "Xenos"
}

create_armies(armies)

# saving useful static information so all lookup times are reduced from n to 1
$grim_dark_armies = {}
Army.all.each { |army| $grim_dark_armies[army.name] = army }

puts "Armies created successfully."
