# create_table "weapons", force: :cascade do |t|
#     t.string "name", null: false
#     t.boolean "meelee", null: false
#     t.integer "range", null: false
#     t.integer "attacks", null: false
#     t.integer "proficiency", null: false
#     t.integer "strength", null: false
#     t.string "damage", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

# number of attacks a weapon has can change depending on the model that is weilding it.
# the proficiency of a weapon can change depending on the model that is weilding it.
# strength of a weapon can change depending on the model that is weilding it.

def create_weapons(weapons)
    weapons.each do |weapon|
        Weapon.create({
            name: weapon[:name],
            meelee: weapon[:meelee],
            range: weapon[:range],
            attacks: weapon[:attacks],
            proficiency: weapon[:proficiency],
            strength: weapon[:strength],
            armour_penetration: weapon[:armour_penetration],
            damage: weapon[:damage]
        })
    end
end

weapons = [
    armoured_hull = {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1"
    },
    attack_squig = {
        name: "Attack Squig",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    beastchoppa = {
        name: "Beastchoppa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2"
    },
    beast_snagga_klaw = {
        name: "Beast Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2"
    },
    big_chompas_jaws = {
        name: "Big Chompa's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -2,
        damage: "4"
    },
    big_choppa = {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    big_shoota = {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 4,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    boomstikks = {
        name: "Boomstikks",
        meelee: false,
        range: 12,
        attacks: "6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    bubblechukka_big_bubble = {
        name: "Bubblechukka - Big Bubble",
        meelee: false,
        range: 48,
        attacks: "2d6",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    },
    bubblechukka_wobbly_bubble = {
        name: "Bubblechukka - Wobbly Bubble",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    },
    bubblechukka_dense_bubble = {
        name: "Bubblechukka - Dense Bubble",
        meelee: false,
        range: 48,
        attacks: "d3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "d6+3"
    },
    burna = {
        name: "Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    breacha_ram = {
        name: "Breacha-Ram",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    },
    burna_exhausts = {
        name: "Burna Exhausts",
        meelee: false,
        range: 6,
        attacks: "2d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    butcha_boyz = {
        name: "Butcha Boyz",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    },
    choppa = {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1"
    }, 
    close_combat_weapon = {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    cuttin_flames = {
        name: "Cuttin' Flames",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: -2,
        damage: "1"
    },
    da_grabzappa = {
        name: "Da Grabzappa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "7",
        armour_penetration: -2,
        damage: "2"
    },
    deff_rolla = {
        name: "Deff Rolla",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "9",
        armour_penetration: -1,
        damage: "2"
    },
    deffgun = {
        name: "Deffgun",
        meelee: false,
        range: 48,
        attacks: "2",
        proficiency: 6,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    deffstorm_mega_shoota = {
        name: "Deffstorm Mega-Shoota",
        meelee: false,
        range: 36,
        attacks: "20",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    },
    dread_klaw = {
        name: "Dread Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "12",
        armour_penetration: -2,
        damage: "3"
    },
    drilla = {
        name: "Drilla",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "12",
        armour_penetration: -3,
        damage: "3"
    },
    eadbanger = {
        name: "Eadbanger",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 4,
        strength: "6",
        armour_penetration: -3,
        damage: "1"
    },
    eavy_lobba = {
        name: "Eavy Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2"
    },
    eyez_of_mork = {
        name: "Eyez of Mork",
        meelee: false,
        range: 18,
        attacks: "d6",
        proficiency: 5,
        strength: "8",
        armour_penetration: -3,
        damage: "2"
    },
    gaze_of_gork_glare = {
        name: "Gaze of Gork - Glare",
        meelee: false,
        range: 24,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    gaze_of_gork_squint = {
        name: "Gaze of Gork - Squint",
        meelee: false,
        range: 18,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -4,
        damage: "3"
    },
    gorks_klaw_strike = {
        name: "Gork's Klaw - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "14",
        armour_penetration: -3,
        damage: "4"
    },
    gorks_klaw_sweep = {
        name: "Gork's Klaw - Sweep",
        meelee: true,
        range: 0,
        attacks: "12",
        proficiency: 2,
        strength: "8",
        armour_penetration: -2,
        damage: "2"
    },
    grabbain_klaw = {
        name: "Grabbain' Klaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "8",
        armour_penetration: -2,
        damage: "2"
    },
    grot_blasta = {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1"
    },
    grot_crew = {
        name: "Grot Crew",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 5,
        strength: "2",
        armour_penetration: 0,
        damage: "1"
    },
    grotzooka = {
        name: "Grotzooka",
        meelee: false,
        range: 18,
        attacks: "d3+3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    },
    gutrippa = {
        name: "Gutrippa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "7",
        armour_penetration: -1,
        damage: "3"
    },
    kan_klaw = {
        name: "Kan Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "8",
        armour_penetration: -2,
        damage: "3"
    },
    kan_shoota = {
        name: "Kan Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 4,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    kannon_frag = {
        name: "Kannon - Frag",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "1"
    },
    kannon_shell = {
        name: "Kannon - Shell",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6"
    },
    kill_kannon = {
        name: "Kill Kannon",
        meelee: false,
        range: 24,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    },
    killa_jet_burna = {
        name: "Killa Jet - Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    },
    killa_jet_cutta = {
        name: "Killa Jet - Cutta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -4,
        damage: "d6"
    },
    killsaw = {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    },
    klaw_of_gork_strike = {
        name: "Klaw of Gork - Strike",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6"
    },
    klaw_of_gork_sweep = {
        name: "Klaw of Gork - Sweep",
        meelee: true,
        range: 0,
        attacks: "15",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    klaw_of_mork_strike = {
        name: "Klaw of Mork - Strike",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6"
    },
    klaw_of_mork_sweep = {
        name: "Klaw of Mork - Sweep",
        meelee: true,
        range: 0,
        attacks: "8",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    kombi_weapon = {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    kopta_rokkits = {
        name: "Kopta Rokkit",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    },
    kustom_mega_blasta = {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    },
    kustom_mega_kannon = {
        name: "Kustom Mega-Kannon",
        meelee: false,
        range: 36,
        attacks: "d6",
        proficiency: 4,
        strength: "12",
        armour_penetration: -1,
        damage: "d6"
    },
    kustom_mega_slugga = {
        name: "Kustom Mega-Slugga",
        meelee: false,
        range: 12,
        attacks: "d3",
        proficiency: 5,
        strength: "8",
        armour_penetration: -2,
        damage: "d6"
    },
    kustom_mega_zappa = {
        name: "Kustom Mega-Zappa",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6"
    },
    kustom_shokk_rifle = {
        name: "Kustom Shokk Rifle",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 3,
        strength: 8,
        armour_penetration: -2,
        damage: "d6+1"
    },
    kustom_shoota = {
        name: "Kustom Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    lobba = {
        name: "Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    makaris_stabba = {
        name: "Makari's Stabba",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1"
    },
    mek_speshul = {
        name: "Mek Speshul",
        meelee: false,
        range: 24,
        attacks: "12",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    },
    morks_roar = {
        name: "Mork's Roar",
        meelee: false,
        range: 36,
        attacks: "12",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    nose_drill = {
        name: "Nose Drill",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    power_klaw = {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    },
    power_snappa = {
        name: "Power Snappa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2"
    },
    rivet_kannon = {
        name: "Rivet Kannon",
        meelee: false,
        range: 36,
        attacks: "6",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "2"
    },
    rokkit_launcha = {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    },
    rokkit_kannon = {
        name: "Rokkit Kannon",
        meelee: false,
        range: 24,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    },
    runtherd_tools = {
        name: "Runtherd Tools",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    saddlegit_weapons = {
        name: "Saddlegit Weapons",
        meelee: false,
        range: 9,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1"
    },
    savage_horns_and_hooves = {
        name: "Savage Horns and Hooves",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "3"
    },
    saw_blades = {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "10",
        armour_penetration: -1,
        damage: "2"
    },
    sawn_off_shotgun = {
        name: "Sawn-off Shotgun",
        meelee: false,
        range: 12,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    shoota = {
        name: "Shoota",
        meelee: false,
        range: 18,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    shokk_attack_gun = {
        name: "Shokk Attack Gun",
        meelee: false,
        range: 60,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -4,
        damage: "d6"
    },
    spiked_ram = {
        name: "Spiked Ram",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2"
    },
    skorcha = {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    },
    skorcha_missle_rack = {
        name: "Skorcha Missle Rack",
        meelee: false,
        range: 36,
        attacks: "2d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    },
    slugga = {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    smasha_gun = {
        name: "Smasha Gun",
        meelee: false,
        range: 48,
        attacks: "d3+1",
        proficiency: 4,
        strength: "9",
        armour_penetration: -3,
        damage: "3"
    },
    snagga_klaw = {
        name: "Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2"
    },
    snazzgun = {
        name: "Snazzgun",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    },
    speshul_kommando_shoota = {
        name: "Speshul Kommando Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    spiked_wheels = {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1"
    },
    spiked_wheels_boomdakka_snazzwagon = {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2"
    },
    spinnin_blades = {
        name: "Spinnin' Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    stikka_kannon = {
        name: "Stikka Kannon",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3"
    },
    stompy_feet = {
        name: "Stompy Feet",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    squig_launchas = {
        name: "Squig Launchas",
        meelee: false,
        range: 36,
        attacks: "d6+6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "2"
    },
    squigosaurs_jaws = {
        name: "Squigosaur's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "7",
        armour_penetration: -2,
        damage: "3"
    },
    tellyport_blasta = {
        name: "Tellyport Blasta",
        meelee: false,
        range: 12,
        attacks: "3",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "3"
    },
    thump_gun = {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2"
    },
    tracks_and_wheels = {
        name: "Tracks and Wheels",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 4,
        strength: "8",
        armour_penetration: 0,
        damage: "1"
    },
    traktor_blasta = {
        name: "Traktor Blasta",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1"
    },
    traktor_kannon = {
        name: "Traktor Kannon",
        meelee: false,
        range: 48,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1"
    },
    twin_big_shoota = {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "5",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    },
    twin_killsaw = {
        name: "Twin Killsaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    },
    twin_slugga = {
        name: "Twin Slugga",
        meelee: false,
        range: 12,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    },
    twin_super_shoota = {
        name: "Twin Super-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    },
    uge_choppa = {
        name: "Uge Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 2,
        strength: "12",
        armour_penetration: -2,
        damage: "2"
    },
    urty_syringe = {
        name: "Urty Syringe",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 3,
        strength: "2",
        armour_penetration: 0,
        damage: "1"
    },
    weirdboy_staff = {
        name: "Weirdboy Staff",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "d3"
    },
    wing_missiles = {
        name: "Wing Missiles",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    },
    wreckin_ball = {
        name: "Wreckin' Ball",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: 0,
        damage: "d6"
    },
    wurrtower = {
        name: "Wurrtower",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 0,
        strength: "12",
        armour_penetration: -3,
        damage: "d6"
    },
    zzap_gun = {
        name: "Zzap Gun",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "d6+6",
        armour_penetration: -3,
        damage: "5"
    }
]

create_weapons(weapons)
