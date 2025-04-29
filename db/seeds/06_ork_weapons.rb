# This file contains all of information for all weapons for all ork models and assigns
puts "creating Ork weapons..."

def create_weapons(ork_weapons)
    $ork_models.each do |ork_name, ork_details|
        puts "Failed to create #{ork_name}'s weapons" unless ork_weapons[ork_name]
        ork_weapons[ork_name].each do |weapon|
            Weapon.create({
                name: weapon[:name],
                meelee: weapon[:meelee],
                range: weapon[:range],
                attacks: weapon[:attacks],
                proficiency: weapon[:proficiency],
                strength: weapon[:strength],
                armour_penetration: weapon[:armour_penetration],
                damage: weapon[:damage],
                model_id: ork_details.id
            })
        end
    end
end

ork_weapons = {}
ork_weapons["Beastboss"] = [
    {
        name: "Shoota",
        meelee: false,
        range: 18,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },  {
        name: "Beast Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2",
        default: true
    },  {
        name: "Beastchoppa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Beastboss On Squigosaur"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2"
    },  {
        name: "Beastchoppa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Squigosaur's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "7",
        armour_penetration: -2,
        damage: "3",
        default: true
    }
]

ork_weapons["Big Mek"] = [
    {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Traktor Blasta",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1"
    }, {
        name: "Drilla",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "12",
        armour_penetration: -3,
        damage: "3"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Big Mek In Mega Armour"] = [
    {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Kustom Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Tellyport Blasta",
        meelee: false,
        range: 12,
        attacks: "3",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "3"
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Big Mek With Shokk Attack Gun"] = [
    {
        name: "Shokk Attack Gun",
        meelee: false,
        range: 60,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -4,
        damage: "d6",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Boss Snikrot"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Mork's Teeth",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Deffkilla Wartrike"] = [
    {
        name: "Boomstikks",
        meelee: false,
        range: 12,
        attacks: "6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Killa Jet - Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Killa Jet - Cutta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -4,
        damage: "d6",
        default: true
    }, {
        name: "Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Makari"] = [
    {
        name: "Makari's Stabba",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Ghazghkull Thraka"] = [
    {
        name: "Mork's Roar",
        meelee: false,
        range: 36,
        attacks: "12",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Gork's Klaw - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "14",
        armour_penetration: -3,
        damage: "4",
        default: true
    }, {
        name: "Gork's Klaw - Sweep",
        meelee: true,
        range: 0,
        attacks: "12",
        proficiency: 2,
        strength: "8",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Mek"] = [
    {
        name: "Kustom Mega-Slugga",
        meelee: false,
        range: 12,
        attacks: "d3",
        proficiency: 5,
        strength: "8",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    }, {
        name: "Wrench",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Mozrog Skragbad"] = [
    {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        default: true
    }, {
        name: "Big Chompa's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -2,
        damage: "4",
        default: true
    }, {
        name: "Gutrippa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "7",
        armour_penetration: -1,
        damage: "3",
        default: true
    }
]

ork_weapons["Painboss"] = [
    {
        name: "Beast Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Painboy"] = [
    {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        default: true
    }, {
        name: "Urty Syringe",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 3,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Warboss"] = [
    {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Attack Squig",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Twin Slugga",
        meelee: false,
        range: 12,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Warboss In Mega Armour"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 4,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Uge Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 2,
        strength: "12",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Weirdboy"] = [
    {
        name: "Eadbanger",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 4,
        strength: "6",
        armour_penetration: -3,
        damage: "1",
        default: true
    }, {
        name: "Weirdboy Staff",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "d3",
        default: true
    }
]

ork_weapons["Wurrboy"] = [
    {
        name: "Eyez of Mork",
        meelee: false,
        range: 18,
        attacks: "d6",
        proficiency: 5,
        strength: "8",
        armour_penetration: -3,
        damage: "2",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Zodgrod Wortsnagga"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Da Grabzappa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "7",
        armour_penetration: -2,
        damage: "2",
        default: true
    }
]

ork_weapons["Beast Snagga Boyz - Nob"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Power Snappa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Beast Snagga Boyz - Boy"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2"
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    }
]

ork_weapons["Boyz - Boss Nob"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },{
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    },{
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }
]

ork_weapons["Boyz - Boy"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Shoota",
        meelee: false,
        range: 18,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        default: true
    }
]

ork_weapons["Trukk"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Wreckin' Ball",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: 0,
        damage: "d6"
    }
]

ork_weapons["Big’ed Bossbunka"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Gaze of Gork - Glare",
        meelee: false,
        range: 24,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Gaze of Gork - Squint",
        meelee: false,
        range: 18,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -4,
        damage: "3",
        default: true
    }
]

ork_weapons["Battlewagon"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Kannon - Frag",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Kannon - Shell",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Kill Kannon",
        meelee: false,
        range: 24,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Zzap Gun",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "d6+6",
        armour_penetration: -3,
        damage: "5"
    }, {
        name: "Deff Rolla",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "9",
        armour_penetration: -1,
        damage: "2"
    }, {
        name: "Grabbain' Klaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "8",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Tracks and Wheels",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 4,
        strength: "8",
        armour_penetration: 0,
        damage: "1",
        default: true
    },  {
        name: "Wreckin' Ball",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: 0,
        damage: "d6"
    }
]

ork_weapons["Blitza-bommer"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Boomdakka Snazzwagon"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Mek Speshul",
        meelee: false,
        range: 24,
        attacks: "12",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Burna Boyz - Spanner"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }
]

ork_weapons["Burna Boyz - Boy"] = [
    {
        name: "Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Cuttin' Flames",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: -2,
        damage: "1",
        default: true
    }
]

ork_weapons["Burna-bommer"] = [
    {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Skorcha Missle Rack",
        meelee: false,
        range: 36,
        attacks: "2d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Dakkajet"] = [
    {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        num_equip: 2,
        default: true
    },  {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Deff Dread"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        num_equip: 2,
        default: true
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Dread Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        num_equip: 2,
        default: true
    }, {
        name: "Stompy Feet",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Deffkoptas"] = [
    {
        name: "Kopta Rokkits",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },  {
        name: "Spinnin' Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Flash Gitz"] = [
    {
        name: "Snazzgun",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        default: true
    }
]

ork_weapons["Gorkanaut"] = [
    {
        name: "Deffstorm Mega-Shoota",
        meelee: false,
        range: 36,
        attacks: "20",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        num_equip: 2,
        default: true
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        num_equip: 2,
        default: true
    }, {
        name: "Klaw of Gork - Strike",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6",
        default: true
    }, {
        name: "Klaw of Gork - Sweep",
        meelee: true,
        range: 0,
        attacks: "15",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Gretchin - Runtherd"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Runtherd Tools",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Gretchin - Grot"] = [
    {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 5,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Hunta Rig"] = [
    {
        name: "Eavy Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        default: true
    }, {
        name: "Stikka Kannon",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Butcha Boyz",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Savage Horns and Hooves",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "3",
        default: true
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "10",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Kill Rig"] = [
    {
        name: "Eavy Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        default: true
    }, {
        name: "Stikka Kannon",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Wurrtower",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 0,
        strength: "12",
        armour_penetration: -3,
        damage: "d6",
        default: true
    }, {
        name: "Butcha Boyz",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Savage Horns and Hooves",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "3",
        default: true
    },  {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "10",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Killa Kans"] = [
    {
        name: "Kan Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 4,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Grotzooka",
        meelee: false,
        range: 18,
        attacks: "d3+3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Kan Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "8",
        armour_penetration: -2,
        damage: "3",
        default: true
    }
]

ork_weapons["Kommandos - Boss Nob"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },  {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        default: true
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }, 
]

ork_weapons["Kommandos - Kommando"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },  {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        default: true
    }, {
        name: "Speshul Kommando Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Breacha-Ram",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }
]

ork_weapons["Kustom Boosta-Blasta"] = [
    {
        name: "Burna Exhausts",
        meelee: false,
        range: 6,
        attacks: "2d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Rivet Kannon",
        meelee: false,
        range: 36,
        attacks: "6",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Spiked Ram",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Lootas - Spanner"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Lootas - Loota"] = [
    {
        name: "Deffgun",
        meelee: false,
        range: 48,
        attacks: "2",
        proficiency: 6,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Meganobz"] = [
    {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Kustom Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        default: true
    },  {
        name: "Twin Killsaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2"
    }
]

ork_weapons["Megatrakk Scrapjet"] = [
    {
        name: "Rokkit Kannon",
        meelee: false,
        range: 24,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        num_equip: 2,
        default: true
    }, {
        name: "Wing Missiles",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Nose Drill",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Mek Gunz"] = [
    {
        name: "Bubblechukka - Big Bubble",
        meelee: false,
        range: 48,
        attacks: "2d6",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Bubblechukka - Wobbly Bubble",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Bubblechukka - Dense Bubble",
        meelee: false,
        range: 48,
        attacks: "d3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "d6+3"
    }, {
        name: "Kustom Mega-Kannon",
        meelee: false,
        range: 36,
        attacks: "d6",
        proficiency: 4,
        strength: "12",
        armour_penetration: -1,
        damage: "d6"
    }, {
        name: "Smasha Gun",
        meelee: false,
        range: 48,
        attacks: "d3+1",
        proficiency: 4,
        strength: "9",
        armour_penetration: -3,
        damage: "3",
        default: true
    }, {
        name: "Traktor Kannon",
        meelee: false,
        range: 48,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1"
    }, {
        name: "Grot Crew",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 5,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Morkanaut"] = [
    {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Kustom Mega-Zappa",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        num_equip: 2,
        default: true
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        num_equip: 2,
        default: true
    }, {
        name: "Klaw of Mork - Strike",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6",
        default: true
    }, {
        name: "Klaw of Mork - Sweep",
        meelee: true,
        range: 0,
        attacks: "12",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Nobz"] = [
    {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }
]

ork_weapons["Rukkatrukk Squigbuggy"] = [
    {
        name: "Sawn-off Shotgun",
        meelee: false,
        range: 12,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Squig Launchas",
        meelee: false,
        range: 36,
        attacks: "d6+6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Shokkjump Dragsta"] = [
    {
        name: "Kustom Shokk Rifle",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 3,
        strength: 8,
        armour_penetration: -2,
        damage: "d6+1",
        default: true
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Squighog Boyz - Nob on Smasha Squig"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Squighog Jaws and Saddlegits",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Squighog Boyz - Squighog Boy"] = [
    {
        name: "Stikka",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Stikka",
        meelee: false,
        range: 9,
        attacks: "1",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Saddlegit Weapons",
        meelee: false,
        range: 9,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Squighog Jaws and Saddlegits",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        default: true
    }
]

ork_weapons["Stompa"] = [
    {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        num_equip: 3,
        default: true
    },  {
        name: "Deffkannon",
        meelee: false,
        range: 72,
        attacks: "3d6",
        proficiency: 5,
        strength: "14",
        armour_penetration: -3,
        damage: "d6",
        default: true
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        default: true
    }, {
        name: "Supa-Gatler",
        meelee: false,
        range: 24,
        attacks: "20",
        proficiency: 5,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        default: true
    }, {
        name: "Supa-Rokkits",
        meelee: false,
        range: 100,
        attacks: "d6",
        proficiency: 5,
        strength: "12",
        armour_penetration: -3,
        damage: "d6+2",
        default: true
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Mega-Choppa - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "24",
        armour_penetration: -5,
        damage: "10",
        default: true
    }, {
        name: "Mega-Choppa - Sweep",
        meelee: true,
        range: 0,
        attacks: "18",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "3",
        default: true
    }
]

ork_weapons["Stormboy - Boss Nob"] = [
    {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        default: true
    }
]

ork_weapons["Stormboy - Stormboy"] = [
    {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        default: true
    }
]

ork_weapons["Warbikers - Boss Nob on Warbike"] = [
    {
        name: "Twin Dakkagun",
        meelee: false,
        range: 18,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    },{
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2"
    }
]

ork_weapons["Warbikers - Warbiker"] = [
    {
        name: "Twin Dakkagun",
        meelee: false,
        range: 18,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        default: true
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1"
    }
]

ork_weapons["Wazbom Blastajet"] = [
    {
        name: "Smasha Gun",
        meelee: false,
        range: 48,
        attacks: "d3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -3,
        damage: "4",
        default: true
    }, {
        name: "Twin Wazbom Mega-Kannon",
        meelee: false,
        range: 36,
        attacks: "d3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -2,
        damage: "d6",
        default: true
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Twin Tellyport Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -1,
        damage: "d6+1"
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        default: true
    }
]

ork_weapons["Breaka Boyz - Boy"] = [
    {
        name: "Smash Hammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Knucklebustas",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1"
    }, {
        name: "Tankhammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3"
    },
]

ork_weapons["Breaka Boyz - Boss Nob"] = [
    {
        name: "Smash Hammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Rokkit Pistol",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true,
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        default: true
    }
]

ork_weapons["Tankbustas - Boss Nob"] = [
    {
        name: "Rokkit Pistol",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        num_equip: 2,
        default: true
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        default: true
    }, {
        name: "Smash Hammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3"
    }
]

ork_weapons["Tankbustas - Tankbusta"] = [
    {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        default: true
    },
]

ork_weapons["Gargantuan Squiggoth"] = [
    {
        name: "Kannon - Frag",
        meelee: false,
        range: 36,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1"
    }, {
        name: "Kannon - Shell",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6"
    }, {
        name: "Supa-Kannon",
        meelee: false,
        range: 60,
        attacks: "2d6",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3"
    }, {
        name: "Huge Tusk - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "14",
        armour_penetration: -3,
        damage: "12",
        default: true
    }, {
        name: "Huge Tusk - Sweep",
        meelee: true,
        range: 0,
        attacks: "18",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        default: true
    }
]

create_weapons(ork_weapons)

puts "Ork weapons created successfully."
