p("Creating Squad Leaders...")

def seed_ork_squad_leader_connection(ork_leaders)
    ork_leaders.each do |leader, squads|
        squads.each do |squad|
            SquadLeader.create({
                leader_id: $ork_models[leader].id,
                squad_id: $ork_models[squad].id
                })
        end
    end
end
ork_leaders = {}

ork_leaders["Beastboss"] = [
    "Beast Snagga Boyz - Boy",
    "Beast Snagga Boyz - Nob"
]

ork_leaders["Beastboss On Squigosaur"] = [
    "Squighog Boyz - Nob on Smasha Squig",
    "Squighog Boyz - Squighog Boy"
]

ork_leaders["Big Mek"] = [
    "Boyz - Boss Nob",
    "Boyz - Boy",
    "Lootas - Loota",
    "Lootas - Spanner",
    "Mek Gunz",
    "Nobz",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy",
    "Tankbustas - Boss Nob",
    "Tankbustas - Tankbusta"
]

ork_leaders["Big Mek In Mega Armour"] = [
    "Meganobz"
]

ork_leaders["Big Mek With Shokk Attack Gun"] = [
    "Boyz - Boss Nob",
    "Boyz - Boy",
    "Lootas - Loota",
    "Lootas - Spanner",
    "Mek Gunz",
    "Nobz",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy",
    "Tankbustas - Boss Nob",
    "Tankbustas - Tankbusta"
]

ork_leaders["Boss Snikrot"] = [
    "Kommandos - Boss Nob",
    "Kommandos - Kommando"
]

ork_leaders["Deffkilla Wartrike"] = [
    "Warbikers - Boss Nob on Warbike",
    "Warbikers - Warbiker"
]

ork_leaders["Ghazghkull Thraka"] = [
    "Meganobz"
]

ork_leaders["Mek"] = [
    "Boyz - Boss Nob",
    "Boyz - Boy",
    "Lootas - Loota",
    "Lootas - Spanner",
    "Mek Gunz",
    "Nobz",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy",
    "Tankbustas - Boss Nob",
    "Tankbustas - Tankbusta"
]

ork_leaders["Mozrog Skragbad"] = [
    "Squighog Boyz - Nob on Smasha Squig",
    "Squighog Boyz - Squighog Boy"
]

ork_leaders["Painboss"] = [
    "Beast Snagga Boyz - Boy",
    "Beast Snagga Boyz - Nob"
]

ork_leaders["Painboy"] = [
    "Boyz - Boss Nob",
    "Boyz - Boy",
    "Burna Boyz - Boy",
    "Burna Boyz - Spanner",
    "Lootas - Loota",
    "Lootas - Spanner",
    "Nobz",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy",
    "Tankbustas - Boss Nob",
    "Tankbustas - Tankbusta"
]

ork_leaders["Warboss"] = [
    "Beast Snagga Boyz - Boy",
    "Beast Snagga Boyz - Nob",
    "Nobz",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy"
]

ork_leaders["Warboss In Mega Armour"] = [
    "Meganobz"
]

ork_leaders["Weirdboy"] = [
    "Beast Snagga Boyz - Boy",
    "Beast Snagga Boyz - Nob",
    "Breaka Boyz - Boss Nob",
    "Breaka Boyz - Boy"
]

ork_leaders["Wurrboy"] = [
    "Beast Snagga Boyz - Boy",
    "Beast Snagga Boyz - Nob"
]

ork_leaders["Zodgrod Wortsnagga"] = [
    "Gretchin - Grot",
    "Gretchin - Runtherd"
]

seed_ork_squad_leader_connection(ork_leaders)

p("Squad Leaders Created successfully.")
