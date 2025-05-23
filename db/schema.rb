# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_12_183150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "name", null: false
    t.text "flavour_text"
    t.text "rule", null: false
    t.text "example"
    t.text "tldr"
    t.string "ability_type", null: false
    t.integer "model_id"
    t.integer "army_id"
    t.integer "wargear_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_type"], name: "index_abilities_on_ability_type"
    t.index ["army_id"], name: "index_abilities_on_army_id"
    t.index ["model_id"], name: "index_abilities_on_model_id"
    t.index ["name"], name: "index_abilities_on_name"
  end

  create_table "armies", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "alliance", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alliance"], name: "index_armies_on_alliance"
  end

  create_table "available_strategems", force: :cascade do |t|
    t.integer "keyword_id", null: false
    t.integer "strategem_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id", "strategem_id"], name: "index_available_strategems_on_keyword_id_and_strategem_id", unique: true
  end

  create_table "deployments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detachments", force: :cascade do |t|
    t.string "detachment_name", null: false
    t.text "detachment_description"
    t.string "rule_name", null: false
    t.text "rule_description"
    t.text "rule", null: false
    t.text "keyword_info"
    t.integer "model_id"
    t.integer "keyword_id"
    t.integer "army_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_detachments_on_army_id"
  end

  create_table "enhancement_keywords", force: :cascade do |t|
    t.integer "enhancement_id", null: false
    t.integer "keyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enhancement_id", "keyword_id"], name: "index_enhancement_keywords_on_enhancement_id_and_keyword_id", unique: true
  end

  create_table "enhancements", force: :cascade do |t|
    t.integer "detachment_id", null: false
    t.integer "cost", null: false
    t.string "name", null: false
    t.text "flavour_text", null: false
    t.text "rule", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detachment_id"], name: "index_enhancements_on_detachment_id"
  end

  create_table "excluded_strategem_keywords", force: :cascade do |t|
    t.integer "strategem_id"
    t.integer "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "friend_one_id", null: false
    t.integer "friend_two_id", null: false
    t.boolean "pending", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_one_id", "friend_two_id"], name: "index_friends_on_friend_one_id_and_friend_two_id", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.integer "player_one_id", null: false
    t.integer "player_two_id", null: false
    t.string "game_name", null: false
    t.text "note"
    t.integer "list_value_limit", null: false
    t.integer "mission_rule_id", null: false
    t.integer "deployment_id", null: false
    t.integer "terrain_id", null: false
    t.integer "battle_round", null: false
    t.integer "player_one_list_id", null: false
    t.integer "player_two_list_id", null: false
    t.integer "player_one_vps", null: false
    t.integer "player_two_vps", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_one_id"], name: "index_games_on_player_one_id"
    t.index ["player_two_id"], name: "index_games_on_player_two_id"
  end

  create_table "games_secondary_objectives", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "player_id", null: false
    t.integer "secondary_objective_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id", "player_id", "secondary_objective_id"], name: "idx_on_game_id_player_id_secondary_objective_id_80fac296f0", unique: true
  end

  create_table "keywords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_keywords_on_name", unique: true
  end

  create_table "lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "army_id", null: false
    t.integer "value_limit", null: false
    t.integer "value", null: false
    t.string "name", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "mission_rules", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_keywords", force: :cascade do |t|
    t.integer "model_id", null: false
    t.integer "keyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_id", "keyword_id"], name: "index_model_keywords_on_model_id_and_keyword_id", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "movement", null: false
    t.integer "army_id", null: false
    t.float "cost", null: false
    t.integer "min_squad", null: false
    t.integer "max_squad", null: false
    t.integer "unit_limit", null: false
    t.integer "toughness", null: false
    t.integer "armour_save", null: false
    t.integer "invuln_save", null: false
    t.integer "wounds", null: false
    t.integer "leadership", null: false
    t.integer "obj_control", null: false
    t.integer "affiliate_model_id"
    t.integer "big_squad_points_adjustment", default: 0
    t.integer "leader_or_squad_ids", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["army_id"], name: "index_models_on_army_id"
  end

  create_table "squad_leaders", force: :cascade do |t|
    t.integer "leader_id"
    t.integer "squad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strategem_keywords", force: :cascade do |t|
    t.integer "strategem_id", null: false
    t.integer "keyword_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strategem_id", "keyword_id"], name: "index_strategem_keywords_on_strategem_id_and_keyword_id", unique: true
  end

  create_table "strategems", force: :cascade do |t|
    t.string "name", null: false
    t.text "flavour_text", null: false
    t.integer "cost", null: false
    t.text "when", null: false
    t.text "target", null: false
    t.text "effect", null: false
    t.string "category", null: false
    t.text "restrictions"
    t.integer "detachment_id"
    t.integer "player_turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detachment_id"], name: "index_strategems_on_detachment_id"
  end

  create_table "terrain_layouts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.string "note"
    t.integer "list_id", null: false
    t.integer "leader_one_id"
    t.integer "leader_two_id"
    t.integer "squad_id", null: false
    t.string "squad_quantity", null: false
    t.integer "enhancement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_units_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "wargear_options", force: :cascade do |t|
    t.integer "model_id", null: false
    t.integer "default_loadout", null: false, array: true
    t.integer "add_any", default: [], array: true
    t.integer "alt_loadout_one", default: [], array: true
    t.integer "alt_loadout_two", default: [], array: true
    t.integer "alt_loadout_three", default: [], array: true
    t.integer "alt_loadout_four", default: [], array: true
    t.integer "alt_loadout_five", default: [], array: true
    t.integer "first_select_one", default: [], array: true
    t.integer "second_select_one", default: [], array: true
    t.integer "third_select_one", default: [], array: true
    t.integer "fourth_select_one", default: [], array: true
    t.integer "models_per_weapon_one"
    t.integer "for_n_models_one", default: [], array: true
    t.integer "models_per_weapon_two"
    t.integer "for_n_models_two", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_abilities", force: :cascade do |t|
    t.integer "weapon_id", null: false
    t.integer "ability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weapon_id", "ability_id"], name: "index_weapon_abilities_on_weapon_id_and_ability_id", unique: true
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "meelee", null: false
    t.integer "range", default: 0
    t.string "attacks", null: false
    t.integer "proficiency", null: false
    t.string "strength", null: false
    t.integer "armour_penetration", default: 0
    t.string "damage", null: false
    t.integer "equipped", default: 0
    t.integer "equip_limit", default: 1
    t.integer "model_id", null: false
    t.integer "weapon_id"
    t.integer "models_per_weapon"
    t.string "wargear_types", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
