puts "Creating armies..."

$grim_dark_armies = {
    ORKS: "Orks",
}

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
    name: $grim_dark_armies[:ORKS],
    description:"The Orks are the most belligerent and resourceful race in the galaxy. Rampaging across the void in their billions, 
        the greenskins devastate everything in their path with their ramshackle weapons and war machines, 
        taking brutish glee in wanton destruction and revelling in warfare for its own sake.",
    alliance: "Xenos"
}

create_armies(armies)

puts "Armies created successfully."
