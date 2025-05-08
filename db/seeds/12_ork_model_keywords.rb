puts "Creating Ork model keywords..."

def seed_ork_model_keywords(ork_model_keywords)
    ork_keyword = $keywords["Orks"]
    ork_model_keywords.each do |model, keywords|
        found_model = Model.find_by(name: model)
        ModelKeyword.create({
            model_id: found_model.id,
            keyword_id: ork_keyword.id
        })
        keywords.each do |keyword|
            found_keyword = Keyword.find_by(name: keyword)
            ModelKeyword.create({
                model_id: found_model.id,
                keyword_id: found_keyword.id
            })
        end
    end
end

ork_model_keywords = {}

ork_model_keywords["Battlewagon"] = [ "Vehicle", "Transport", "Battlewagon" ]
ork_model_keywords["Beast Snagga Boyz - Boy"] = [ "Infantry", "Mob", "Battleline", "Beast Snagga", "Beast Snagga Boyz" ]
ork_model_keywords["Beast Snagga Boyz - Nob"] = [ "Infantry", "Mob", "Battleline", "Beast Snagga", "Beast Snagga Boyz" ]
ork_model_keywords["Beastboss"] = [ "Infantry", "Beast Snagga", "Character", "Warboss", "Beastboss" ]
ork_model_keywords["Beastboss On Squigosaur"] = [ "Character", "Mounted", "Beast Snagga", "Warboss", "Beastboss On Squigosaur" ]
ork_model_keywords["Big Mek"] = [ "Infantry", "Character", "Grenades", "Mek", "Big Mek" ]
ork_model_keywords["Big Mek In Mega Armour"] = [ "Infantry", "Character", "Mega Armour", "Mek", "Big Mek In Mega Armour" ]
ork_model_keywords["Big Mek With Shokk Attack Gun"] = [ "Infantry", "Character", "Grenades", "Mek", "Big Mek With Shokk Attack Gun" ]
ork_model_keywords["Big’ed Bossbunka"] = [ "Fortification", "Big’ed Bossbunka", "Vehicle", "Transport" ]
ork_model_keywords["Blitza-bommer"] = [ "Vehicle", "Aircraft", "Fly", "Blitza-bommer", "Speed Freeks" ]
ork_model_keywords["Boomdakka Snazzwagon"] = [ "Vehicle", "Grenades", "Boomdakka Snazzwagon", "Speed Freeks" ]
ork_model_keywords["Boss Snikrot"] = [ "Infantry", "Character", "Grenades", "Boss Snikrot", "Smoke", "Epic Hero" ]
ork_model_keywords["Boyz - Boss Nob"] = [ "Infantry", "Mob", "Battleline", "Grenades", "Boyz" ]
ork_model_keywords["Boyz - Boy"] = [ "Infantry", "Mob", "Battleline", "Grenades", "Boyz" ]
ork_model_keywords["Breaka Boyz - Boss Nob"] = [ "Infantry", "Grenades", "Breaka Boyz" ]
ork_model_keywords["Breaka Boyz - Boy"] = [ "Infantry", "Grenades", "Breaka Boyz" ]
ork_model_keywords["Burna Boyz - Boy"] = [ "Infantry", "Burna Boyz" ]
ork_model_keywords["Burna Boyz - Spanner"] = [ "Infantry", "Burna Boyz" ]
ork_model_keywords["Burna-bommer"] = [ "Vehicle", "Aircraft", "Fly", "Burna-bommer", "Speed Freeks" ]
ork_model_keywords["Dakkajet"] = [ "Vehicle", "Aircraft", "Fly", "Dakkajet", "Speed Freeks" ]
ork_model_keywords["Deff Dread"] = [ "Vehicle", "Walker", "Deff Dread" ]
ork_model_keywords["Deffkilla Wartrike"] = [ "Mounted", "Character", "Deffkilla Wartrike", "Speed Freeks", "Warboss" ]
ork_model_keywords["Deffkoptas"] = [ "Vehicle", "Fly", "Deffkoptas", "Speed Freeks", "Grenades" ]
ork_model_keywords["Flash Gitz"] = [ "Infantry", "Grenades", "Flash Gitz" ]
ork_model_keywords["Gargantuan Squiggoth"] = [ "Monster", "Gargantuan Squiggoth", "Titanic", "Towering", "Transport" ]
ork_model_keywords["Ghazghkull Thraka"] = [ "Infantry", "Character", "Ghazghkull Thraka", "Epic Hero", "Warboss" ]
ork_model_keywords["Gorkanaut"] = [ "Vehicle", "Walker", "Gorkanaut", "Titanic", "Towering", "Transport" ]
ork_model_keywords["Gretchin - Grot"] = [ "Infantry", "Grots", "Gretchin" ]
ork_model_keywords["Gretchin - Runtherd"] = [ "Infantry", "Grots", "Gretchin" ]
ork_model_keywords["Hunta Rig"] = [ "Vehicle", "Hunta Rig", "Transport", "Beast Snagga" ]
ork_model_keywords["Kill Rig"] = [ "Vehicle", "Kill Rig", "Transport", "Beast Snagga", "Psyker" ]
ork_model_keywords["Killa Kans"] = [ "Vehicle", "Walker", "Killa Kans", "Grots" ]
ork_model_keywords["Kommandos - Boss Nob"] = [ "Infantry", "Grenades", "Kommandos", "Smoke" ]
ork_model_keywords["Kommandos - Kommando"] = [ "Infantry", "Grenades", "Kommandos", "Smoke" ]
ork_model_keywords["Kustom Boosta-Blasta"] = [ "Vehicle", "Kustom Boosta-Blasta", "Speed Freeks", "Grenades" ]
ork_model_keywords["Lootas - Loota"] = [ "Infantry", "Lootas" ]
ork_model_keywords["Lootas - Spanner"] = [ "Infantry", "Lootas" ]
ork_model_keywords["Makari"] = [ "Infantry", "Character", "Ghazghkull Thraka", "Epic Hero", "Warboss" ]
ork_model_keywords["Meganobz"] = [ "Infantry", "Mega Armour", "Meganobz", "Grenades" ]
ork_model_keywords["Megatrakk Scrapjet"] = [ "Vehicle", "Megatrakk Scrapjet", "Speed Freeks" ]
ork_model_keywords["Mek"] = [ "Infantry", "Mek", "Character" ]
ork_model_keywords["Mek Gunz"] = [ "Vehicle", "Mek Gunz", "Grots" ]
ork_model_keywords["Morkanaut"] = [ "Vehicle", "Walker", "Morkanaut", "Titanic", "Towering", "Transport" ]
ork_model_keywords["Mozrog Skragbad"] = [ "Mounted", "Character", "Mozrog Skragbad", "Epic Hero", "Warboss", "Beast Snagga" ]
ork_model_keywords["Nobz"] = [ "Infantry", "Grenades", "Nobz" ]
ork_model_keywords["Painboss"] = [ "Infantry", "Character", "Painboss", "Beast Snagga" ]
ork_model_keywords["Painboy"] = [ "Infantry", "Character", "Painboy" ]
ork_model_keywords["Rukkatrukk Squigbuggy"] = [ "Vehicle", "Rukkatrukk Squigbuggy", "Speed Freeks" ]
ork_model_keywords["Shokkjump Dragsta"] = [ "Vehicle", "Shokkjump Dragsta", "Speed Freeks" ]
ork_model_keywords["Squighog Boyz - Nob on Smasha Squig"] = [ "Mounted", "Beast Snagga", "Squighog Boyz", "Grenades" ]
ork_model_keywords["Squighog Boyz - Squighog Boy"] = [ "Mounted", "Beast Snagga", "Squighog Boyz", "Grenades" ]
ork_model_keywords["Stompa"] = [ "Vehicle", "Walker", "Stompa", "Titanic", "Towering", "Transport" ]
ork_model_keywords["Stormboy - Boss Nob"] = [ "Infantry", "Stormboyz", "Grenades", "Jump Pack", "Fly" ]
ork_model_keywords["Stormboy - Stormboy"] = [ "Infantry", "Stormboyz", "Grenades", "Jump Pack", "Fly" ]
ork_model_keywords["Tankbustas - Boss Nob"] = [ "Infantry", "Tankbustas", "Grenades" ]
ork_model_keywords["Tankbustas - Tankbusta"] = [ "Infantry", "Tankbustas", "Grenades" ]
ork_model_keywords["Trukk"] = [ "Vehicle", "Trukk", "Transport", "Dedicated Transport" ]
ork_model_keywords["Warbikers - Boss Nob on Warbike"] = [ "Mounted", "Warbikers", "Speed Freeks", "Grenades" ]
ork_model_keywords["Warbikers - Warbiker"] = [ "Mounted", "Warbikers", "Speed Freeks", "Grenades" ]
ork_model_keywords["Warboss"] = [ "Infantry", "Character", "Warboss", "Grenades" ]
ork_model_keywords["Warboss In Mega Armour"] = [ "Infantry", "Character", "Mega Armour", "Warboss In Mega Armour", "Warboss" ]
ork_model_keywords["Wazbom Blastajet"] = [ "Vehicle", "Aircraft", "Fly", "Wazbom Blastajet", "Speed Freeks", "Grenades" ]
ork_model_keywords["Weirdboy"] = [ "Infantry", "Character", "Psyker", "Weirdboy" ]
ork_model_keywords["Wurrboy"] = [ "Infantry", "Character", "Psyker", "Wurrboy", "Beast Snagga" ]
ork_model_keywords["Zodgrod Wortsnagga"] = [ "Infantry", "Character", "Zodgrod Wortsnagga", "Epic Hero" ]

seed_ork_model_keywords(ork_model_keywords)

puts "Created Ork model keywords Successfully!"
