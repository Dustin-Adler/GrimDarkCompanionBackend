ork_army_ability_id = Ability.find_by(name: "Whaaagh!").id

Army.create({
    name: "Orks",
    description:"The Orks are the most belligerent and resourceful race in the galaxy. Rampaging across the void in their billions, the greenskins devastate everything in their path with their ramshackle weapons and war machines, taking brutish glee in wanton destruction and revelling in warfare for its own sake.",
    ability_id: ork_army_ability_id,
    alliance: "Xenos"
})
