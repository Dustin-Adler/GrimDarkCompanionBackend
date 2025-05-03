# This file contains all of information for all weapons for all ork models and assigns
puts "creating Ork weapons..."

# class CreateWeapons < ActiveRecord::Migration[8.0]
#     def change
#       create_table :weapons do |t|
#         t.string :name, null: false
#         t.boolean :meelee, null: false
#         t.integer :range, default: 0
#         t.string :attacks, null: false
#         t.integer :proficiency, null: false
#         t.string :strength, null: false
#         t.integer :armour_penetration, default: 0
#         t.string :damage, null: false
#         t.integer :equiped, default: 0
#         t.integer :equip_limit, default: 1
#         t.integer :model_id, null: false,
#         t.integer :weapon_id
#         t.string :wargear_types, array: true, default: []
  
#         t.timestamps
#       end
#     end
#   end

def create_weapons(ork_weapons)
    $ork_models.each do |ork_name, ork_details|
        puts "Failed to create #{ork_name}'s weapons" unless ork_weapons[ork_name]
        multi_prof_weapons = {}
        ork_weapons[ork_name].each do |weapon|
            weapon.weapon_id = multi_prof_weapons[weapon[:name]].id if multi_prof_weapons[weapon[:name]]
            new_weapon = Weapon.create({
                name: weapon[:name],
                meelee: weapon[:meelee],
                range: weapon[:range] || 0,
                attacks: weapon[:attacks],
                proficiency: weapon[:proficiency],
                strength: weapon[:strength],
                armour_penetration: weapon[:armour_penetration] || 0,
                damage: weapon[:damage],
                equipped: weapon[:equipped],
                equip_limit: weapon[:equip_limit] || 1,
                wargear_types: weapon[:wargear_types] || [],
                model_id: ork_details.id
            })

            if weapon[:weapon_id]
                if weapon[:weapon_id].is_a?(Integer)
                    new_weapon.update(weapon_id: weapon.weapon_id) 
                elsif weapon[:weapon_id].is_a?(String)
                    multi_prof_weapons[weapon[:weapon_id]] = weapon[:id]
                end
            end

            # if the new_weapon has a weapon_id, then it has found a matching weapon profile in multi_prof_weapons.
            # We need to update the weapon_id of the matched weapon from multi_prof_weapons. It was created first, and so
            # there was no weapon id to save into the weapon_id row at the time of creation.
            if new_weapon.weapon_id
                linked_weapon_profile = Weapon.find(multi_prof_weapons[new_weapon.name])
                linked_weapon_profile.update(weapon_id: new_weapon.id)
                multi_prof_weapons.delete(new_weapon.name)
            end

            # if the weapon has a value for weapon_id, but can't find a matching profile in multi_prof_weapons, then it's a multi_prof weapon 
            # but it's match or matches haven't been created yet. We save the profile in multi_prof_weapons using the value that was found in weapon_id.
            # weapon_id should be the name of the matching weapon profile, so we use that as the key.
        end
    end
end

# Method used to create a hash of all ork weapons
def get_ork_weapons()
    ork_ids = {}
    $ork_models.each do |model_name, model_details|
        ork_ids[model_details.id] = model_name
    end
    ork_weapons = {}
    Weapon.where(model_id: ork_ids.keys).each do |weapon|
        ork_weapons[ork_ids[weapon.model_id]] = [] if ork_weapons[ork_ids[weapon.model_id]].nil?
        ork_weapons[ork_ids[weapon.model_id]] << weapon
    end
    ork_weapons
end

WARGEAR_TYPES = {
    ADD_ANY: "ADD_ANY",
    ALT_1: "ALT_1",
    ALT_2: "ALT_2",
    ALT_3: "ALT_3",
    ALT_4: "ALT_4",
    ALT_5: "ALT_5",
    FOR_N_MODELS_ONE: "FOR_N_MODELS_ONE",
    FOR_N_MODELS_TWO: "FOR_N_MODELS_TWO",
    FIRST_SELECT_ONE: "FIRST_SELECT_ONE",
    SECOND_SELECT_ONE: "SECOND_SELECT_ONE",
    THIRD_SELECT_ONE: "THIRD_SELECT_ONE",
    FOURTH_SELECT_ONE: "FOURTH_SELECT_ONE"
}

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
        equipped: 1
    },  {
        name: "Beast Snagga Klaw",
        meelee: true,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2",
        equipped: 1
    },  {
        name: "Beastchoppa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    },  {
        name: "Beastchoppa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }, {
        name: "Squigosaur's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "7",
        armour_penetration: -2,
        damage: "3",
        equipped: 1
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
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Traktor Blasta",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Drilla",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "12",
        armour_penetration: -3,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
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
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kustom Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Tellyport Blasta",
        meelee: false,
        range: 12,
        attacks: "3",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        equipped: 1
    }, {
        name: "Kustom Force Field",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
    }, {
        name: "Grot Oiler",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equipped: 1
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Grot Assistant",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equipped: 1
    }, {
        name: "Mork's Teeth",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Killa Jet - Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1,
        weapon_id: "Killa Jet - Cutta"
    }, {
        name: "Killa Jet - Cutta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -4,
        damage: "d6",
        equipped: 1,
        weapon_id: "Killa Jet - Burna"
    }, {
        name: "Snagga Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2",
        equipped: 1
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
        equipped: 1
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
        equipped: 1
    }, {
        name: "Gork's Klaw - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "14",
        armour_penetration: -3,
        damage: "4",
        equipped: 1,
        weapon_id: "Gork's Klaw - Sweep"
    }, {
        name: "Gork's Klaw - Sweep",
        meelee: true,
        range: 0,
        attacks: "12",
        proficiency: 2,
        strength: "8",
        armour_penetration: -2,
        damage: "2",
        equipped: 1,
        weapon_id: "Gork's Klaw - Strike"
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
        equipped: 1
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Wrench",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equipped: 1
    }, {
        name: "Big Chompa's Jaws",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -2,
        damage: "4",
        equipped: 1
    }, {
        name: "Gutrippa",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 2,
        strength: "7",
        armour_penetration: -1,
        damage: "3",
        equipped: 1
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
        equipped: 1
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
        equipped: 1
    }, {
        name: "Urty Syringe",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 3,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Grot Orderly",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equipped: 1
    }, {
        name: "Attack Squig",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Twin Slugga",
        meelee: false,
        range: 12,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equipped: 1
    }, {
        name: "Uge Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 2,
        strength: "12",
        armour_penetration: -2,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Weirdboy Staff",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "d3",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Da Grabzappa",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 2,
        strength: "7",
        armour_penetration: -2,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Power Snappa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equip_limit: 10,
        equipped: 9
    }, {
        name: "Thump Gun",
        meelee: false,
        range: 18,
        attacks: "d3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 10,
        equipped: 9
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS]]
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
        equipped: 1
    }, {
        name: "Kombi-Weapon",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    },{
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
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
        equip_limit: 10,
        equipped: 9
    }, {
        name: "Shoota",
        meelee: false,
        range: 18,
        attacks: "2",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 10,
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
    }, {
        name: "Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_ONE]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_TWO]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 10,
        wargear_types: [WARGEAR_TYPES[:ALT_1], WARGEAR_TYPES[:FOR_N_MODELS_ONE], WARGEAR_TYPES[:FOR_N_MODELS_TWO]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 10,
        equipped: 9
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
        equipped: 1
    }, {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Wreckin' Ball",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: 0,
        damage: "d6",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equip_limit: 4,
        equipped: 1,
        wargear_options: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Gaze of Gork - Glare",
        meelee: false,
        range: 24,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1,
        weapon_id: "Gaze of Gork - Squint"
    }, {
        name: "Gaze of Gork - Squint",
        meelee: false,
        range: 18,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -4,
        damage: "3",
        equipped: 1,
        weapon_id: "Gaze of Gork - Glare"
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
        equip_limit: 4,
        damage: "1"
    }, {
        name: "Kannon - Frag",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        weapon_id: "Kannon - Shell",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kannon - Shell",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6",
        weapon_id: "Kannon - Frag",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kill Kannon",
        meelee: false,
        range: 24,
        attacks: "d6+1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Zzap Gun",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "d6+6",
        armour_penetration: -3,
        damage: "5",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Deff Rolla",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "9",
        armour_penetration: -1,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
    }, {
        name: "Grabbain' Klaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "8",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Tracks and Wheels",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 4,
        strength: "8",
        armour_penetration: 0,
        damage: "1",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:SECOND_SELECT_ONE]]
    },  {
        name: "Wreckin' Ball",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: 0,
        damage: "d6",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equipped: 1
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Mek Speshul",
        meelee: false,
        range: 24,
        attacks: "12",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Spiked Wheels",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equip_limit: 4,
        equipped: 4
    }, {
        name: "Cuttin' Flames",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "4",
        armour_penetration: -2,
        damage: "1",
        equip_limit: 4,
        equipped: 4
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
        equipped: 1
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 5,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Skorcha Missle Rack",
        meelee: false,
        range: 36,
        attacks: "2d6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equip_limit: 3,
        equipped: 2,
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    },  {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equip_limit: 4,
        equipped: 2,
        weapon_types: [
            WARGEAR_TYPES[:FIRST_SELECT_ONE],
            WARGEAR_TYPES[:SECOND_SELECT_ONE],
            WARGEAR_TYPES[:THIRD_SELECT_ONE],
            WARGEAR_TYPES[:FOURTH_SELECT_ONE]]
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        equip_limit: 4,
        weapon_types: [
            WARGEAR_TYPES[:FIRST_SELECT_ONE],
            WARGEAR_TYPES[:SECOND_SELECT_ONE],
            WARGEAR_TYPES[:THIRD_SELECT_ONE],
            WARGEAR_TYPES[:FOURTH_SELECT_ONE]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 4,
        weapon_types: [
            WARGEAR_TYPES[:FIRST_SELECT_ONE],
            WARGEAR_TYPES[:SECOND_SELECT_ONE],
            WARGEAR_TYPES[:THIRD_SELECT_ONE],
            WARGEAR_TYPES[:FOURTH_SELECT_ONE]]
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equip_limit: 4,
        weapon_types: [
            WARGEAR_TYPES[:FIRST_SELECT_ONE],
            WARGEAR_TYPES[:SECOND_SELECT_ONE],
            WARGEAR_TYPES[:THIRD_SELECT_ONE],
            WARGEAR_TYPES[:FOURTH_SELECT_ONE]]
    }, {
        name: "Dread Klaw",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 4,
        equipped: 2,
        weapon_types: [
            WARGEAR_TYPES[:FIRST_SELECT_ONE],
            WARGEAR_TYPES[:SECOND_SELECT_ONE],
            WARGEAR_TYPES[:THIRD_SELECT_ONE],
            WARGEAR_TYPES[:FOURTH_SELECT_ONE]]
    }, {
        name: "Stompy Feet",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equip_limit: 3,
        equipped: 3
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        equip_limit: 2,
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_ONE]]
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 3
    },  {
        name: "Spinnin' Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 3
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
        equip_limit: 5,
        equipped: 5
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 5,
        equipped: 5
    }, {
        name: "Ammo Runt",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_ONE]]
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
        equipped: 1
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 2,
        equipped: 2
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 2,
        equipped: 2
    }, {
        name: "Klaw of Gork - Strike",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6",
        equipped: 1,
        weapon_id: "Klaw of Gork - Sweep"
    }, {
        name: "Klaw of Gork - Sweep",
        meelee: true,
        range: 0,
        attacks: "15",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        equipped: 1,
        weapon_id: "Klaw of Gork - Strike"
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
        equipped: 1
    }, {
        name: "Runtherd Tools",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equip_limit: 10,
        equipped: 10
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "1",
        proficiency: 5,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 10,
        equipped: 10
    }
]

ork_weapons["Hunta Rig"] = [
    {
        name: "'Eavy Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        equipped: 1
    }, {
        name: "Stikka Kannon",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        equipped: 1
    }, {
        name: "Butcha Boyz",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Savage Horns and Hooves",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "3",
        equipped: 1
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "10",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }
]

ork_weapons["Kill Rig"] = [
    {
        name: "'Eavy Lobba",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 5,
        strength: "6",
        armour_penetration: 0,
        damage: "2",
        equipped: 1
    }, {
        name: "Stikka Kannon",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        equipped: 1
    }, {
        name: "Wurrtower",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 0,
        strength: "12",
        armour_penetration: -3,
        damage: "d6",
        equipped: 1
    }, {
        name: "Butcha Boyz",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Savage Horns and Hooves",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "3",
        equipped: 1
    },  {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "10",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equip_limit: 3,
        equipped: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Grotzooka",
        meelee: false,
        range: 18,
        attacks: "d3+3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kan Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "8",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 3,
        equipped: 3
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
        equipped: 1
    },  {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equip_limit: 10,
        equipped: 10
    },  {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 10,
        equipped: 10
    }, {
        name: "Speshul Kommando Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 2,
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 4,
        wargear_types: [WARGEAR_TYPES[:ALT_1], WARGEAR_TYPES[:ALT_3], WARGEAR_TYPES[:ALT_4]]
    }, {
        name: "Breacha-Ram",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:ALT_2]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:ALT_4]]
    }, {
        name: "Burna",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ALT_3]]
    }, {
        name: "Bomb Squig",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Distraction Grot",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
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
        equipped: 1
    }, {
        name: "Grot Blasta",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Rivet Kannon",
        meelee: false,
        range: 36,
        attacks: "6",
        proficiency: 5,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }, {
        name: "Spiked Ram",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kustom Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
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
        equip_limit: 4,
        equipped: 4
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 4,
        equipped: 4
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
        damage: "1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:ALT_1], WARGEAR_TYPES[:ALT_2]]
    }, {
        name: "Kustom Shoota",
        meelee: false,
        range: 18,
        attacks: "4",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 2,
        wargear_types: [WARGEAR_TYPES[:ALT_3]]
    }, {
        name: "Killsaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:ALT_2], WARGEAR_TYPES[:ALT_3], WARGEAR_TYPES[:ALT_4]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        equip_limit: 3,
        equipped: 2,
        wargear_types: [WARGEAR_TYPES[:ALT_1], WARGEAR_TYPES[:ALT_4]]
    },  {
        name: "Twin Killsaw",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "2",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:ALT_5]]
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
        equipped: 1
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 2,
        equipped: 2
    }, {
        name: "Wing Missiles",
        meelee: false,
        range: 24,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equipped: 1
    }, {
        name: "Nose Drill",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        damage: "1",
        equip_limit: 3,
        weapon_id: "Bubblechukka - Wobbly Bubble",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Bubblechukka - Wobbly Bubble",
        meelee: false,
        range: 48,
        attacks: "d6",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 3,
        weapon_id: "Bubblechukka - Dense Bubble",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Bubblechukka - Dense Bubble",
        meelee: false,
        range: 48,
        attacks: "d3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -3,
        damage: "d6+3",
        equip_limit: 3,
        weapon_id: "Bubblechukka - Big Bubble",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kustom Mega-Kannon",
        meelee: false,
        range: 36,
        attacks: "d6",
        proficiency: 4,
        strength: "12",
        armour_penetration: -1,
        damage: "d6",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Smasha Gun",
        meelee: false,
        range: 48,
        attacks: "d3+1",
        proficiency: 4,
        strength: "9",
        armour_penetration: -3,
        damage: "3",
        equip_limit: 3,
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Traktor Kannon",
        meelee: false,
        range: 48,
        attacks: "1",
        proficiency: 4,
        strength: "10",
        armour_penetration: -2,
        damage: "d6+1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Grot Crew",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 5,
        strength: "2",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 1
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
        equipped: 1
    }, {
        name: "Kustom Mega-Zappa",
        meelee: false,
        range: 36,
        attacks: "d6+3",
        proficiency: 5,
        strength: "10",
        armour_penetration: -2,
        damage: "d6",
        equipped: 1
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 2,
        equipped: 2
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 2,
        equipped: 2
    }, {
        name: "Klaw of Mork - Strike",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 3,
        strength: "18",
        armour_penetration: -3,
        damage: "6",
        equipped: 1,
        weapon_id: "Klaw of Mork - Sweep"
    }, {
        name: "Klaw of Mork - Sweep",
        meelee: true,
        range: 0,
        attacks: "12",
        proficiency: 3,
        strength: "8",
        armour_penetration: -1,
        damage: "2",
        equipped: 1,
        weapon_id: "Klaw of Mork - Strike"
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
        damage: "1",
        equip_limit: 5,
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 5,
        equipped: 5
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equip_limit: 5,
        equipped: 5,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 5,
        wargear_types: [WARGEAR_TYPES[:ALT_1]]
    }, {
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        equip_limit: 5,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Ammo Runt",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_ONE]]
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
        equipped: 1
    }, {
        name: "Squig Launchas",
        meelee: false,
        range: 36,
        attacks: "d6+6",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Rokkit Launcha",
        meelee: false,
        range: 24,
        attacks: "d3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equipped: 1
    }, {
        name: "Saw Blades",
        meelee: true,
        range: 0,
        attacks: "4",
        proficiency: 4,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equipped: 1
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }, {
        name: "Squighog Jaws and Saddlegits",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
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
        equip_limit: 3,
        equipped: 3
    }, {
        name: "Stikka",
        meelee: false,
        range: 9,
        attacks: "1",
        proficiency: 5,
        strength: "5",
        armour_penetration: -1,
        damage: "2",
        equip_limit: 3,
        equipped: 3
    }, {
        name: "Saddlegit Weapons",
        meelee: false,
        range: 9,
        attacks: "1",
        proficiency: 4,
        strength: "3",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 3
    }, {
        name: "Squighog Jaws and Saddlegits",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "2",
        equip_limit: 3,
        equipped: 3
    }, {
        name: "Bomb Squig",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:FOR_N_MODELS_ONE]]
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
        equip_limit: 3,
        equipped: 3
    },  {
        name: "Deffkannon",
        meelee: false,
        range: 72,
        attacks: "3d6",
        proficiency: 5,
        strength: "14",
        armour_penetration: -3,
        damage: "d6",
        equipped: 1
    }, {
        name: "Skorcha",
        meelee: false,
        range: 12,
        attacks: "d6",
        proficiency: 0,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        equipped: 1
    }, {
        name: "Supa-Gatler",
        meelee: false,
        range: 24,
        attacks: "20",
        proficiency: 5,
        strength: "7",
        armour_penetration: -1,
        damage: "2",
        equipped: 1
    }, {
        name: "Supa-Rokkits",
        meelee: false,
        range: 100,
        attacks: "d6",
        proficiency: 5,
        strength: "12",
        armour_penetration: -3,
        damage: "d6+2",
        equipped: 1
    }, {
        name: "Twin Big Shoota",
        meelee: false,
        range: 36,
        attacks: "3",
        proficiency: 5,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Mega-Choppa - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "24",
        armour_penetration: -5,
        damage: "10",
        equipped: 1,
        weapon_id: "Mega-Choppa - Sweep"
    }, {
        name: "Mega-Choppa - Sweep",
        meelee: true,
        range: 0,
        attacks: "18",
        proficiency: 3,
        strength: "10",
        armour_penetration: -2,
        damage: "3",
        equipped: 1,
        weapon_id: "Mega-Choppa - Strike"
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
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        equipped: 1
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
        equip_limit: 5,
        equipped: 4
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 5,
        equipped: 4
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
        equipped: 1
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    },{
        name: "Power Klaw",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "9",
        armour_penetration: -2,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Big Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "7",
        armour_penetration: 1,
        damage: "2",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equip_limit: 3,
        equipped: 2
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        equipped: 2
    }, {
        name: "Slugga",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "4",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "4",
        armour_penetration: 1,
        damage: "1",
        equip_limit: 3,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equipped: 1
    }, {
        name: "Twin Wazbom Mega-Kannon",
        meelee: false,
        range: 36,
        attacks: "d3",
        proficiency: 4,
        strength: "12",
        armour_penetration: -2,
        damage: "d6",
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Twin Supa-Shoota",
        meelee: false,
        range: 36,
        attacks: "4",
        proficiency: 4,
        strength: "6",
        armour_penetration: -1,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }, {
        name: "Twin Tellyport Mega-Blasta",
        meelee: false,
        range: 24,
        attacks: "3",
        proficiency: 5,
        strength: "9",
        armour_penetration: -1,
        damage: "d6+1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Armoured Hull",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 4,
        strength: "6",
        armour_penetration: 0,
        damage: "1",
        equipped: 1
    }, {
        name: "Blastajet Force Field",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:ADD_ANY]]
    }
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
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Rokkit Pistol",
        meelee: false,
        range: 12,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equip_limit: 2,
        equipped: 1,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        equipped: 1
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
        equip_limit: 5,
        equipped: 5,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Knucklebustas",
        meelee: true,
        range: 0,
        attacks: "5",
        proficiency: 3,
        strength: "5",
        armour_penetration: -1,
        damage: "1",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Tankhammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    },
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
        equip_limit: 2,
        equipped: 2,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Choppa",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 1,
        damage: "1",
        equipped: 1
    }, {
        name: "Smash Hammer",
        meelee: true,
        range: 0,
        attacks: "2",
        proficiency: 3,
        strength: "6",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
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
        equip_limit: 6,
        equipped: 5,
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Close Combat Weapon",
        meelee: true,
        range: 0,
        attacks: "3",
        proficiency: 3,
        strength: "5",
        armour_penetration: 0,
        damage: "1",
        equip_limit: 5,
        equipped: 5
    }, {
        name: "Pulsa Rokkit",
        meelee: false,
        range: 0,
        attacks: "0",
        proficiency: 0,
        strength: "0",
        armour_penetration: 0,
        damage: "0",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }
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
        damage: "1",
        weapon_id: "Kannon - Shell",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Kannon - Shell",
        meelee: false,
        range: 36,
        attacks: "1",
        proficiency: 5,
        strength: "9",
        armour_penetration: -2,
        damage: "d6",
        weapon_id: "Kannon - Frag",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Supa-Kannon",
        meelee: false,
        range: 60,
        attacks: "2d6",
        proficiency: 5,
        strength: "12",
        armour_penetration: -2,
        damage: "3",
        wargear_types: [WARGEAR_TYPES[:FIRST_SELECT_ONE]]
    }, {
        name: "Huge Tusk - Strike",
        meelee: true,
        range: 0,
        attacks: "6",
        proficiency: 3,
        strength: "14",
        armour_penetration: -3,
        damage: "12",
        equipped: 1,
        weapon_id: "Huge Tusk - Sweep"
    }, {
        name: "Huge Tusk - Sweep",
        meelee: true,
        range: 0,
        attacks: "18",
        proficiency: 3,
        strength: "9",
        armour_penetration: -2,
        damage: "3",
        equipped: 1,
        weapon_id: "Huge Tusk - Strike"
    }
]

create_weapons(ork_weapons)

$orks_models_and_weapons = get_ork_weapons()

puts "Ork weapons created successfully."
