puts "creating Ork wargear options..."

def create_wargear_type_for_wargear_options(wargear_options_hash, wargear_option, weapon_wargear_type, weapon_id, models_per_weapon = nil)
   wargear_options_hash[wargear_option] = [] if wargear_options_hash[wargear_option].nil?
   wargear_options_hash[wargear_option] << weapon_id
   if models_per_weapon
      wargear_option == :for_n_models_one ? wargear_options_hash[:models_per_weapon_one] = models_per_weapon : wargear_options_hash[:models_per_weapon_two] = models_per_weapon
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
                     create_wargear_type_for_wargear_options(wargear, :add_any, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:ALT_1]
                     create_wargear_type_for_wargear_options(wargear, :alt_loadout_one, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:ALT_2]
                     create_wargear_type_for_wargear_options(wargear, :alt_loadout_two, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:ALT_3]
                     create_wargear_type_for_wargear_options(wargear, :alt_loadout_three, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:ALT_4]
                     create_wargear_type_for_wargear_options(wargear, :alt_loadout_four, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:ALT_5]
                     create_wargear_type_for_wargear_options(wargear, :alt_loadout_five, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:FOR_N_MODELS_ONE]
                     create_wargear_type_for_wargear_options(wargear, :for_n_models_one, wargear_type, weapon.id, weapon.models_per_weapon)
                  when WARGEAR_TYPES[:FOR_N_MODELS_TWO]
                     create_wargear_type_for_wargear_options(wargear, :for_n_models_two, wargear_type, weapon.id, weapon.models_per_weapon)
                  when WARGEAR_TYPES[:FIRST_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :first_select_one, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:SECOND_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :second_select_one, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:THIRD_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :third_select_one, wargear_type, weapon.id)
                  when WARGEAR_TYPES[:FOURTH_SELECT_ONE]
                     create_wargear_type_for_wargear_options(wargear, :fourth_select_one, wargear_type, weapon.id)
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
