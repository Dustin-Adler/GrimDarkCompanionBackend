# create_table "abilities", force: :cascade do |t|
#     t.string "name", null: false
#     t.text "description", null: false
#     t.text "rule", null: false
#     t.text "example", null: false
#     t.string "tldr", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end

Ability.create({
    name: "Whaaagh!",
    description: "The infamous war cry of the Orks is known and feared throughout the galaxy. When it echoes across the battlefield, bellowed from hundreds or even thousands of greenskin mouths, even the most stalwart warriors fear the onslaught to come.",
    rule: "If your Army Faction is ORKS, once per battle, at the start of your Command phase, you can call a Waaagh!. If you do, until the start of your next Command phase, the Waaagh! is active for your army and:
        Units from your army with this ability are eligible to declare a charge in a turn in which they Advanced.
        Add 1 to the Strength and Attacks characteristics of melee weapons equipped by models from your army with this ability.
        Models from your army with this ability have a 5+ invulnerable save.",
    example: "n/a",
    tldr: "Once per battle, for one round. Units advance and charge. Add 1 to Strength and Attacks of melee weapons. 5+ invuln save."
})