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