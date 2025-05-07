# create_table "keywords", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["name"], name: "index_keywords_on_name", unique: true
#   end

puts "Creating keywords..."

def create_keywords(keywords)
    keywords.each do |keyword|
        Keyword.create({
            name: keyword
        })
    end
end

keywords = [
    "Aircraft",
    "Battleline",
    "Battlewagon",
    "Beast Snagga",
    "Beast Snagga Boyz",
    "Beastboss",
    "Beastboss On Squigosaur",
    "Big Mek",
    "Big Mek In Mega Armour",
    "Big Mek With Shokk Attack Gun",
    "Big’ed Bossbunka",
    "Blitza-bommer",
    "Boomdakka Snazzwagon",
    "Boss Snikrot",
    "Boyz",
    "Breaka Boyz",
    "Burna Boyz",
    "Burna-bommer",
    "Character",
    "Dakkajet",
    "Dedicated Transport",
    "Deff Dread",
    "Deffkilla Wartrike",
    "Deffkoptas",
    "Epic Hero",
    "Flash Gitz",
    "Fly",
    "Fortification",
    "Gargantuan Squiggoth",
    "Ghazghkull Thraka",
    "Gorkanaut",
    "Grenades",
    "Gretchin",
    "Grots",
    "Hunta Rig",
    "Infantry",
    "Jump Pack",
    "Kill Rig",
    "Killa Kans",
    "Kommandos",
    "Kustom Boosta-Blasta",
    "Lootas",
    "Mega Armour",
    "Meganobz",
    "Megatrakk Scrapjet",
    "Mek",
    "Mek Gunz",
    "Mob",
    "Monster",
    "Morkanaut",
    "Mounted",
    "Mozrog Skragbad",
    "Nobz",
    "Orks",
    "Painboss",
    "Painboy",
    "Psyker",
    "Rukkatrukk Squigbuggy",
    "Shokkjump Dragsta",
    "Smoke",
    "Speed Freeks",
    "Squighog Boyz",
    "Stompa",
    "Stormboyz",
    "Tankbustas",
    "Titanic",
    "Towering",
    "Transport",
    "Trukk",
    "Vehicle",
    "Walker",
    "Warbikers",
    "Warboss",
    "Warboss In Mega Armour",
    "Wazbom Blastajet",
    "Weirdboy",
    "Wurrboy",
    "Zodgrod Wortsnagga"
]

create_keywords(keywords)

puts "Keywords created successfully."
