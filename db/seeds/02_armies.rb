# create_table "armies", force: :cascade do |t|
#     t.string "name", null: false
#     t.string "description", null: false
#     t.integer "ability_id", null: false
#     t.string "alliance", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["alliance"], name: "index_armies_on_alliance"
#   end

ork_army_ability_id = Ability.find_by(name: "Whaaagh!").id

Army.create({
    name: "Orks",
    description:"The Orks are the most belligerent and resourceful race in the galaxy. Rampaging across the void in their billions, the greenskins devastate everything in their path with their ramshackle weapons and war machines, taking brutish glee in wanton destruction and revelling in warfare for its own sake.",
    ability_id: ork_army_ability_id,
    alliance: "Xenos"
})
