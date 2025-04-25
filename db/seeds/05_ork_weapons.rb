# This file contains all of information for all weapons for all ork models and assigns

orks_army_id = Army.where(name: "Orks").first.id
orks = Model.where(army_id: orks_army_id)

def create_weapons(orks, orks_weapons)
    orks.each do |ork|
        orks_weapons[ork.name].each do |weapon|
            Weapon.create({
                name: weapon[:name],
                meelee: weapon[:meelee],
                range: weapon[:range],
                attacks: weapon[:attacks],
                proficiency: weapon[:proficiency],
                strength: weapon[:strength],
                armour_penetration: weapon[:armour_penetration],
                damage: weapon[:damage],
                model_id: ork.id
            })
        end
    end
end

ork_weapons = {
    "Beastboss" => [
        {
            name: "Shoota",
            meelee: false,
            range: 18,
            attacks: "2",
            proficiency: 4,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        },  {
            name: "Beast Snagga Klaw",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "10",
            armour_penetration: -2,
            damage: "2"
        },  {
            name: "Beastchoppa",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 2,
            strength: "6",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Beastboss On Squigosaur" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
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
            damage: "2"
        }, {
            name: "Squigosaur's Jaws",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "7",
            armour_penetration: -2,
            damage: "3"
        }
    ], "Big Mek" => [
        {
            name: "Kustom Mega-Blasta",
            meelee: false,
            range: 24,
            attacks: "3",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "d6"
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
            damage: "2"
        }
    ], "Big Mek In Mega Armour" => [
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
            damage: "d6"
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
            damage: "2"
        }
    ], "Big Mek With Shokk Attack Gun" => [
        {
            name: "Shokk Attack Gun",
            meelee: false,
            range: 60,
            attacks: "d6+1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -4,
            damage: "d6"
        }, {
            name: "Close Combat Weapon",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Boss Snikrot" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 4,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Mork's Teeth",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 2,
            strength: "6",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Deffkilla Wartrike" => [
        {
            name: "Boomstikks",
            meelee: false,
            range: 12,
            attacks: "6",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Killa Jet - Burna",
            meelee: false,
            range: 12,
            attacks: "d6",
            proficiency: 0,
            strength: "5",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Killa Jet - Cutta",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -4,
            damage: "d6"
        }, {
            name: "Snagga Klaw",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "10",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Makari" => [
        {
            name: "Makari's Stabba",
            meelee: true,
            range: 0,
            attacks: "1",
            proficiency: 4,
            strength: "3",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Ghazghkull Thraka" => [
        {
            name: "Mork's Roar",
            meelee: false,
            range: 36,
            attacks: "12",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Gork's Klaw - Strike",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 2,
            strength: "14",
            armour_penetration: -3,
            damage: "4"
        }, {
            name: "Gork's Klaw - Sweep",
            meelee: true,
            range: 0,
            attacks: "12",
            proficiency: 2,
            strength: "8",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Mek" => [
        {
            name: "Kustom Mega-Slugga",
            meelee: false,
            range: 12,
            attacks: "d3",
            proficiency: 5,
            strength: "8",
            armour_penetration: -2,
            damage: "d6"
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
            damage: "1"
        }
    ], "Mozrog Skragbad" => [
        {
            name: "Thump Gun",
            meelee: false,
            range: 18,
            attacks: "d3",
            proficiency: 5,
            strength: "6",
            armour_penetration: 0,
            damage: "2"
        }, {
            name: "Big Chompa's Jaws",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "7",
            armour_penetration: -2,
            damage: "4"
        }, {
            name: "Gutrippa",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 2,
            strength: "7",
            armour_penetration: -1,
            damage: "3"
        }
    ], "Painboss" => [
        {
            name: "Beast Snagga Klaw",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "9",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Painboy" => [
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
            name: "Urty Syringe",
            meelee: true,
            range: 0,
            attacks: "1",
            proficiency: 3,
            strength: "2",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Warboss" => [
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
        }
    ], "Warboss In Mega Armour" => [
        {
            name: "Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 4,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Uge Choppa",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 2,
            strength: "12",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Weirdboy" => [
        {
            name: "Eadbanger",
            meelee: false,
            range: 24,
            attacks: "1",
            proficiency: 4,
            strength: "6",
            armour_penetration: -3,
            damage: "1"
        }, {
            name: "Weirdboy Staff",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "8",
            armour_penetration: -1,
            damage: "d3"
        }
    ], "Wurrboy" => [
        {
            name: "Eyez of Mork",
            meelee: false,
            range: 18,
            attacks: "d6",
            proficiency: 5,
            strength: "8",
            armour_penetration: -3,
            damage: "2"
        }, {
            name: "Close Combat Weapon",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Zodgrod Wortsnagga" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Da Grabzappa",
            meelee: true,
            range: 0,
            attacks: "5",
            proficiency: 2,
            strength: "7",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Beast Snagga Boyz - Nob" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Power Snappa",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Beast Snagga Boyz - Boy" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
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
            damage: "1"
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
    ], "Boyz - Boss Nob" => [{
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
            damage: "2"
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
    ], "Boyz - Boy" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
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
            damage: "1"
        }
    ], "Trukk" => [
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
            name: "Spiked Wheels",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "6",
            armour_penetration: 0,
            damage: "1"
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
    ], "Big’ed Bossbunka" => [
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
            name: "Gaze of Gork - Glare",
            meelee: false,
            range: 24,
            attacks: "d6",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Gaze of Gork - Squint",
            meelee: false,
            range: 18,
            attacks: "1",
            proficiency: 5,
            strength: "12",
            armour_penetration: -4,
            damage: "3"
        }
    ], "Battlewagon" => [
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
            damage: "1"
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
    ], "Blitza-bommer" => [
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
            name: "Twin Supa-Shoota",
            meelee: false,
            range: 36,
            attacks: "4",
            proficiency: 5,
            strength: "6",
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
            damage: "1"
        }
    ], "Boomdakka Snazzwagon" => [
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
            name: "Grot Blasta",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 4,
            strength: "3",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Mek Speshul",
            meelee: false,
            range: 24,
            attacks: "12",
            proficiency: 5,
            strength: "5",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Spiked Wheels",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Burna Boyz - Spanner" => [
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
            name: "Close Combat Weapon",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
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
    ], "Burna Boyz - Boy" => [
        {
            name: "Burna",
            meelee: false,
            range: 12,
            attacks: "d6",
            proficiency: 0,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Cuttin' Flames",
            meelee: true,
            range: 0,
            attacks: "2",
            proficiency: 4,
            strength: "4",
            armour_penetration: -2,
            damage: "1"
        }
    ], "Burna-bommer" => [
        {
            name: "Twin Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Twin Supa-Shoota",
            meelee: false,
            range: 36,
            attacks: "4",
            proficiency: 5,
            strength: "6",
            armour_penetration: -1,
            damage: "1"
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
            damage: "1"
        }
    ], "Dakkajet" => [
        {
            name: "Twin Supa-Shoota",
            meelee: false,
            range: 36,
            attacks: "4",
            proficiency: 5,
            strength: "6",
            armour_penetration: -1,
            damage: "1"
        },  {
            name: "Armoured Hull",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "6",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Deff Dread" => [
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
            damage: "3"
        }, {
            name: "Stompy Feet",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Deffkoptas" => [
        {
            name: "Kopta Rokkit",
            meelee: false,
            range: 24,
            attacks: "d3",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
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
            damage: "1"
        },  {
            name: "Spinnin' Blades",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Flash Gitz" => [
        {
            name: "Snazzgun",
            meelee: false,
            range: 24,
            attacks: "3",
            proficiency: 5,
            strength: "6",
            armour_penetration: -1,
            damage: "2"
        }, {
            name: "Choppa",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "5",
            armour_penetration: 1,
            damage: "1"
        }
    ], "Gorkanaut" => [
        {
            name: "Deffstorm Mega-Shoota",
            meelee: false,
            range: 36,
            attacks: "20",
            proficiency: 5,
            strength: "6",
            armour_penetration: -1,
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
            name: "Skorcha",
            meelee: false,
            range: 12,
            attacks: "d6",
            proficiency: 0,
            strength: "5",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Twin Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Klaw of Gork - Strike",
            meelee: true,
            range: 0,
            attacks: "5",
            proficiency: 3,
            strength: "18",
            armour_penetration: -3,
            damage: "6"
        }, {
            name: "Klaw of Gork - Sweep",
            meelee: true,
            range: 0,
            attacks: "15",
            proficiency: 3,
            strength: "8",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Gretchin - Runtherd" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Runtherd Tools",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Gretchin - Grot" => [
        {
            name: "Grot Blasta",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 4,
            strength: "3",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Close Combat Weapon",
            meelee: true,
            range: 0,
            attacks: "1",
            proficiency: 5,
            strength: "2",
            armour_penetration: 0,
            damage: "1"
        }
    ], "Hunta Rig" => [
        {
            name: "Eavy Lobba",
            meelee: false,
            range: 48,
            attacks: "d6",
            proficiency: 5,
            strength: "6",
            armour_penetration: 0,
            damage: "2"
        }, {
            name: "Stikka Kannon",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "12",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Butcha Boyz",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "5",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Savage Horns and Hooves",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "8",
            armour_penetration: -1,
            damage: "3"
        }, {
            name: "Saw Blades",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 3,
            strength: "10",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Kill Rig" => [
        {
            name: "Eavy Lobba",
            meelee: false,
            range: 48,
            attacks: "d6",
            proficiency: 5,
            strength: "6",
            armour_penetration: 0,
            damage: "2"
        }, {
            name: "Stikka Kannon",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "12",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Wurrtower",
            meelee: false,
            range: 24,
            attacks: "d3",
            proficiency: 0,
            strength: "12",
            armour_penetration: -3,
            damage: "d6"
        }, {
            name: "Butcha Boyz",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "5",
            armour_penetration: -1,
            damage: "1"
        }, {
            name: "Savage Horns and Hooves",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "8",
            armour_penetration: -1,
            damage: "3"
        },  {
            name: "Saw Blades",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 3,
            strength: "10",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Killa Kans" => [
        {
            name: "Kan Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 4,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
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
            damage: "3"
        }
    ], "Kommandos - Boss Nob" => [
        {
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
    ], "Kommandos - Kommando" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        },  {
            name: "Choppa",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "4",
            armour_penetration: 1,
            damage: "1"
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
    ], "Lootas - Spanner" => [
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
    ], "Lootas - Loota" => [
        {
            name: "Deffgun",
            meelee: false,
            range: 48,
            attacks: "2",
            proficiency: 6,
            strength: "8",
            armour_penetration: -1,
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
    ], "Meganobz" => [
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
            damage: "1"
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
            damage: "2"
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
    ], "Megatrakk Scrapjet" => [
        {
            name: "Rokkit Kannon",
            meelee: false,
            range: 24,
            attacks: "d6+1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Twin Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Wing Missiles",
            meelee: false,
            range: 24,
            attacks: "1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Nose Drill",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "8",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Mek Gunz" => [
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
            damage: "3"
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
            damage: "1"
        }
    ], "Morkanaut" => [
        {
            name: "Kustom Mega-Blasta",
            meelee: false,
            range: 24,
            attacks: "3",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "d6"
        }, {
            name: "Kustom Mega-Zappa",
            meelee: false,
            range: 36,
            attacks: "d6+3",
            proficiency: 5,
            strength: "10",
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
            name: "Twin Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Klaw of Mork - Strike",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 3,
            strength: "18",
            armour_penetration: -3,
            damage: "6"
        }, {
            name: "Klaw of Mork - Sweep",
            meelee: true,
            range: 0,
            attacks: "12",
            proficiency: 3,
            strength: "8",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Nobz" => [
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
            damage: "1"
        }, {
            name: "Big Choppa",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
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
    ], "Rukkatrukk Squigbuggy" => [
        {
            name: "Sawn-off Shotgun",
            meelee: false,
            range: 12,
            attacks: "2",
            proficiency: 5,
            strength: "4",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Squig Launchas",
            meelee: false,
            range: 36,
            attacks: "d6+6",
            proficiency: 5,
            strength: "5",
            armour_penetration: -1,
            damage: "2"
        }, {
            name: "Saw Blades",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Shokkjump Dragsta" => [
        {
            name: "Kustom Shokk Rifle",
            meelee: false,
            range: 24,
            attacks: "1",
            proficiency: 3,
            strength: 8,
            armour_penetration: -2,
            damage: "d6+1"
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
            name: "Saw Blades",
            meelee: true,
            range: 0,
            attacks: "4",
            proficiency: 4,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Squighog Boyz - Nob on Smasha Squig" => [
        {
            name: "Slugga",
            meelee: false,
            range: 12,
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
            damage: "2"
        }
    ], "Squighog Boyz - Squighog Boy" => [
        {
            name: "Stikka",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: -1,
            damage: "2"
        }, {
            name: "Stikka",
            meelee: false,
            range: 9,
            attacks: "1",
            proficiency: 5,
            strength: "5",
            armour_penetration: -1,
            damage: "2"
        }, {
            name: "Saddlegit Weapons",
            meelee: false,
            range: 9,
            attacks: "1",
            proficiency: 4,
            strength: "3",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Squighog Jaws and Saddlegits",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "6",
            armour_penetration: -1,
            damage: "2"
        }
    ], "Stompa" => [
        {
            name: "Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        },  {
            name: "Deffkannon",
            meelee: false,
            range: 72,
            attacks: "3d6",
            proficiency: 5,
            strength: "14",
            armour_penetration: -3,
            damage: "d6"
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
            name: "Supa-Gatler",
            meelee: false,
            range: 24,
            attacks: "20",
            proficiency: 5,
            strength: "7",
            armour_penetration: -1,
            damage: "2"
        }, {
            name: "Supa-Rokkits",
            meelee: false,
            range: 100,
            attacks: "d6",
            proficiency: 5,
            strength: "12",
            armour_penetration: -3,
            damage: "d6+2"
        }, {
            name: "Twin Big Shoota",
            meelee: false,
            range: 36,
            attacks: "3",
            proficiency: 5,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        }, {
            name: "Mega-Choppa - Strike",
            meelee: true,
            range: 0,
            attacks: "6",
            proficiency: 3,
            strength: "24",
            armour_penetration: -5,
            damage: "10"
        }, {
            name: "Mega-Choppa - Sweep",
            meelee: true,
            range: 0,
            attacks: "18",
            proficiency: 3,
            strength: "10",
            armour_penetration: -2,
            damage: "3"
        }
    ], "Stormboy - Boss Nob" => [
        {
            name: "Power Klaw",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "9",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Stormboy - Stormboy" => [
        {
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
    ], "Warbikers - Boss Nob on Warbike" => [
        {
            name: "Power Klaw",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 4,
            strength: "9",
            armour_penetration: -2,
            damage: "2"
        }
    ], "Warbikers - Warbiker" => [
        {
            name: "Twin Dakkagun",
            meelee: false,
            range: 18,
            attacks: "3",
            proficiency: 5,
            strength: "5",
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
    ], "Wazbom Blastajet" => [
        {
            name: "Smasha Gun",
            meelee: false,
            range: 48,
            attacks: "d3",
            proficiency: 4,
            strength: "9",
            armour_penetration: -3,
            damage: "4"
        }, {
            name: "Twin Wazbom Mega-Kannon",
            meelee: false,
            range: 36,
            attacks: "d3",
            proficiency: 4,
            strength: "12",
            armour_penetration: -2,
            damage: "d6"
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
            damage: "1"
        }
    ], "Breaka Boyz - Boy" => [
        {
            name: "Smash Hammer",
            meelee: true,
            range: 0,
            attacks: "2",
            proficiency: 3,
            strength: "6",
            armour_penetration: -2,
            damage: "3"
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
    ], "Breaka Boyz - Boss Nob" => [
        {
            name: "Rokkit Pistol",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Choppa",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: 1,
            damage: "1"
        }
    ], "Tankbustas - Boss Nob" => [
        {
            name: "Rokkit Pistol",
            meelee: false,
            range: 12,
            attacks: "1",
            proficiency: 5,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
        }, {
            name: "Choppa",
            meelee: true,
            range: 0,
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: 1,
            damage: "1"
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
    ], "Tankbustas - Tankbusta" => [
        {
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
            attacks: "3",
            proficiency: 3,
            strength: "5",
            armour_penetration: 0,
            damage: "1"
        },
    ], "Gargantuan Squiggoth" => [
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
            damage: "12"
        }, {
            name: "Huge Tusk - Sweep",
            meelee: true,
            range: 0,
            attacks: "18",
            proficiency: 3,
            strength: "9",
            armour_penetration: -2,
            damage: "3"
        }
    ]
}

create_weapons(orks, ork_weapons)
