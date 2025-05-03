# class CreateWargearOptions < ActiveRecord::Migration[8.0]
#     def change
#       create_table :wargear_options do |t|
#         t.integer :model_id, null: false
#         t.integer :weapon_loadouts, array: true, default: []
#         t.integer :add_any, array: true, default: []
#         t.integer :select_one, array:true, default: []
#         t.integer :for_n_models
#         t.integer :for_n_models_weapon_swap, array:true, default: []
  
#         t.timestamps
#       end
#     end
#   end

require_relative '../db/seeds/07_orks_weapons.rb'

def create_wargear_options(wargear_options) 
   $orks_models_and_weapons.each do |model_name, weapons_array|
      weapons_array.each do |weapon|
         unless weapon.wargear_types.empty?
            weapon.wargear_types.each do |wargear_type|
               case wargear_type
                  when WARGEAR_TYPES[:ADD_ANY]
                     wargear_options[model_name][:add_any] << weapon.id
                  when WARGEAR_TYPES[:ALT_1]
                     wargear_options[model_name][:weapon_loadouts] << weapon.id
                  when WARGEAR_TYPES[:ALT_2]
                     wargear_options[model_name][:weapon_loadouts] << weapon.id
                  when WARGEAR_TYPES[:ALT_3]
                     wargear_options[model_name][:weapon_loadouts] << weapon.id
                  when WARGEAR_TYPES[:ALT_4]
                     wargear_options[model_name][:weapon_loadouts] << weapon.id
                  when WARGEAR_TYPES[:ALT_5]
                     wargear_options[model_name][:weapon_loadouts] << weapon.id
                  when WARGEAR_TYPES[:FOR_N_MODELS_ONE]
                     wargear_options[model_name][:for_n_models_weapon_swap] << weapon.id
                  when WARGEAR_TYPES[:FOR_N_MODELS_TWO]
                     wargear_options[model_name][:for_n_models_weapon_swap] << weapon.id
                  when WARGEAR_TYPES[:FIRST_SELECT_ONE]
                     wargear_options[model_name][:select_one] << weapon.id
                  when WARGEAR_TYPES[:SECOND_SELECT_ONE]
                     wargear_options[model_name][:select_one] << weapon.id
                  when WARGEAR_TYPES[:THIRD_SELECT_ONE]
                     wargear_options[model_name][:select_one] << weapon.id
                  when WARGEAR_TYPES[:FOURTH_SELECT_ONE]
                     wargear_options[model_name][:select_one] << weapon.id
         end
         

         wargear_options[model_name]
         weapon_loadouts: [],
         add_any: [],
         select_one: [],
         for_n_models: 0,
         for_n_models_weapon_swap: []
      end
   end
end


wargear_options = {}

 wargear_options["Battlewagon"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Beast Snagga Boyz - Boy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Beast Snagga Boyz - Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Beastboss"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Beastboss On Squigosaur"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Big Mek"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Big Mek In Mega Armour"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Big Mek With Shokk Attack Gun"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Big’ed Bossbunka"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Blitza-bommer"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Boomdakka Snazzwagon"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Boss Snikrot"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Boyz - Boss Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Boyz - Boy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Breaka Boyz - Boss Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Breaka Boyz - Boy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Burna Boyz - Boy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Burna Boyz - Spanner"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Burna-bommer"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Dakkajet"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Deff Dread"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Deffkilla Wartrike"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Deffkoptas"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Flash Gitz"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Gargantuan Squiggoth"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Ghazghkull Thraka"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Gorkanaut"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Gretchin - Grot"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Gretchin - Runtherd"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Hunta Rig"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Kill Rig"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Killa Kans"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Kommandos - Boss Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Kommandos - Kommando"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Kustom Boosta-Blasta"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Lootas - Loota"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Lootas - Spanner"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Makari"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Meganobz"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Megatrakk Scrapjet"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Mek"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Mek Gunz"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Morkanaut"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Mozrog Skragbad"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Nobz"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Painboss"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Painboy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Rukkatrukk Squigbuggy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Shokkjump Dragsta"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Squighog Boyz - Nob on Smasha Squig"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Squighog Boyz - Squighog Boy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Stompa"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Stormboy - Boss Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Stormboy - Stormboy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Tankbustas - Boss Nob"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Tankbustas - Tankbusta"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Trukk"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Warbikers - Boss Nob on Warbike"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Warbikers - Warbiker"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Warboss"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Warboss In Mega Armour"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Wazbom Blastajet"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Weirdboy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Wurrboy"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 wargear_options["Zodgrod Wortsnagga"] = {
    weapon_loadouts: [],
    add_any: [],
    select_one: [],
    for_n_models: 0,
    for_n_models_weapon_swap: []
 }

 create_wargear_options(wargear_options)
