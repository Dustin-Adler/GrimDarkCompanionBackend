# require_relative '07_ork_weapons.rb'

puts "creating Ork wargear options..."

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

def create_wargear_type_for_wargear_options(wargear_options_hash, wargear_option, weapon_wargear_type, weapon_id, num_mods_per_weapon = nil)
   # create_wargear_type_for_wargear_options takes in current wargear_options_hash, creates new obj wargear_option => [] for a specific model if it doesn't exist
   # also creates a new object weapon_wargear_type => [] inside of the wargear_option if it doesn't exist and returns either the array that was found or the new array

   wargear_options_hash[wargear_option] = [] if wargear_options_hash[wargear_option].nil?
   if wargear_option == :add_any
      wargear_options_hash[wargear_option] << weapon_id
   else
      wargear_type_index = wargear_options_hash[wargear_option].index { |loadout| loadout[weapon_wargear_type] }
      if wargear_type_index.nil?
         if num_mods_per_weapon.nil?
            debugger if wargear_option == :weapon_loadouts && weapon_wargear_type == WARGEAR_TYPES[:FIRST_SELECT_ONE]
            wargear_options_hash[wargear_option] << {weapon_wargear_type => [weapon_id]}
         else
            wargear_options_hash[wargear_option] << {weapon_wargear_type => [weapon_id], models_per_weapon: num_mods_per_weapon}
         end
      else
         debugger if wargear_option == :weapon_loadouts && weapon_wargear_type == WARGEAR_TYPES[:FIRST_SELECT_ONE]
         wargear_options_hash[wargear_option][wargear_type_index][weapon_wargear_type] << weapon_id
      end
   end
   wargear_options_hash
end

def create_wargear_options
   wargear_options = {}
   $orks_models_and_weapons.each do |model_name, weapons_array|
      wargear = wargear_options[model_name] = {
         model_id: weapons_array[0].model_id,
         default_loadout: []}
      weapons_array.each do |weapon|
         wargear[:default_loadout] << weapon.id if weapon.equipped > 0
         if weapon.wargear_types.any?
            weapon.wargear_types.each do |wargear_type|
               case wargear_type
                  when WARGEAR_TYPES[:ADD_ANY]
                     create_wargear_type_for_wargear_options(wargear, :add_any, WARGEAR_TYPES[:ADD_ANY], weapon.id)
                  when WARGEAR_TYPES[:ALT_1]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:ALT_1], weapon.id)
                  when WARGEAR_TYPES[:ALT_2]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:ALT_2], weapon.id)
                  when WARGEAR_TYPES[:ALT_3]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:ALT_3], weapon.id)
                  when WARGEAR_TYPES[:ALT_4]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:ALT_4], weapon.id)
                  when WARGEAR_TYPES[:ALT_5]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:ALT_5], weapon.id)
                  when WARGEAR_TYPES[:FOR_N_MODELS_ONE]
                     create_wargear_type_for_wargear_options(wargear, :for_n_models_weapon_swap, WARGEAR_TYPES[:FOR_N_MODELS_ONE], weapon.id, weapon.models_per_weapon)
                  when WARGEAR_TYPES[:FOR_N_MODELS_TWO]
                     create_wargear_type_for_wargear_options(wargear, :for_n_models_weapon_swap, WARGEAR_TYPES[:FOR_N_MODELS_TWO], weapon.id, weapon.models_per_weapon)
                  when WARGEAR_TYPES[:FIRST_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:FIRST_SELECT_ONE], weapon.id)
                  when WARGEAR_TYPES[:SECOND_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:SECOND_SELECT_ONE], weapon.id)
                  when WARGEAR_TYPES[:THIRD_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:THIRD_SELECT_ONE], weapon.id)
                  when WARGEAR_TYPES[:FOURTH_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :weapon_loadouts, WARGEAR_TYPES[:FOURTH_SELECT_ONE], weapon.id)
               end
            end
         end
      end
   end
   wargear_options.each do |model_name, wargear_options|
      WargearOption.create(wargear_options)
   end
end

create_wargear_options()

puts "Successfully created Ork Wargear Options"
