puts "Creating Core Strategems and their StrategemKeywords..."

def create_core_strategems(strategems_arr)
  strategems_arr.each do |strategem|
    new_strat = Strategem.create({
      name: strategem[:name],
      flavour_text: strategem[:flavour_text],
      cost: strategem[:cost],
      category: strategem[:category],
      when: strategem[:when],
      target: strategem[:target],
      effect: strategem[:effect],
      restrictions: strategem[:restrictions],
      player_turn: strategem[:player_turn]
    })
    strategem[:keywords]&.each do |keyword|
      keyword_id = $keywords[keyword].id
      StrategemKeyword.create({
        strategem_id: new_strat.id,
        keyword_id: keyword_id
      })
    end
  end
end

STRATEGEM_CATEGORIES = {
  battle_tactic: "Battle Tactic",
  epic_deed: "Epic Deed",
  strategic_ploy: "Strategic Ploy",
  wargear: "Wargear"
}

core_strategems = [
  {
    name: "Command Re-Roll",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "A great commander can bend even the vagaries of fate and fortune to their will, the better to ensure victory.",
    when: "Any phase, just after you make an Advance roll, a Charge roll, a Desperate Escape test or a Hazardous test for a unit from your army, or a Hit roll, a Wound roll, a Damage roll or a saving throw for a model in that unit, or a roll to determine the number of attacks made with a weapon equipped by a model in that unit. If you are using fast dice rolling, this Stratagem can still be used after rolling multiple rolls or saving throws at once.",
    target: "That unit or model from your army.",
    effect: "You re-roll that roll, test or saving throw. If you are using fast dice rolling, select one of those rolls or saving throws to re-roll.",
    player_turn: 2
  }, {
    name: "Counter-Offensive",
    cost: 2,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "In close-quarters combat, the slightest hesitation can leave an opening for a swift foe to exploit.",
    when: "Fight phase, just after an enemy unit has fought.",
    target: "One unit from your army that is within Engagement Range of one or more enemy units and that has not already been selected to fight this phase.",
    effect: "Your unit fights next.",
    player_turn: 2
  }, {
    name: "Epic Challenge",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "The legends of the 41st Millennium are replete with deadly duels between mighty champions.",
    when: "Fight phase, when a Character unit from your army that is within Engagement Range of one or more Attached units is selected to fight.",
    target: "One Character model in your unit.",
    effect: "Until the end of the phase, all melee attacks made by that model have the [PRECISION] ability.",
    keywords: [ "Character" ],
    player_turn: 2
  }, {
    name: "Insane Bravery",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "Indifferent to their own survival, these warriors hold their ground against seemingly impossible odds.",
    when: "Battle-shock step of your Command phase, just before you take a Battle-shock test for a unit from your army.",
    target: "That unit from your army.",
    effect: "Your unit automatically passes that Battle-shock test.",
    restrictions: "You cannot use this Stratagem more than once per battle.",
    player_turn: 0
  }, {
    name: "Grenade",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:wargear],
    flavour_text: "Priming their hand-held projectiles, these warriors draw back and hurl death into the enemy’s midst.",
    when: "Your Shooting phase.",
    target: "One Grenades unit from your army (excluding units that Advanced, Fell Back or have shot this turn) that is not within Engagement Range of one or more enemy units.",
    effect: "Select one Grenades model in your unit and one enemy unit that is not within Engagement Range of any units from your army and is within 8\" of and visible to your Grenades model. Roll six D6: for each 4+, that enemy unit suffers 1 mortal wound.",
    keywords: [ "Grenades" ],
    player_turn: 0
  }, {
    name: "Tank Shock",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Ramming the foe with a speeding vehicle may be an unsubtle tactic, but it is a murderously effective one.",
    when: "Your Charge phase, just after a Vehicle unit from your army ends a Charge move.",
    target: "That Vehicle unit.",
    effect: "Select one enemy unit within Engagement Range of your unit, and select one Vehicle model in your unit that is within Engagement Range of that enemy unit. Roll a number of D6 equal to the Toughness characteristic of the selected Vehicle model. For each 5+, that enemy unit suffers 1 mortal wound (to a maximum of 6 mortal wounds).",
    keywords: [ "Vehicle" ],
    player_turn: 0
  }, {
    name: "Rapid Ingress",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Be it cunning strategy, potent technology or supernatural ritual, there are many means by which a commander may hasten their warriors’ onset.",
    when: "End of your opponent’s Movement phase.",
    target: "One unit from your army that is in Reserves.",
    effect: "Your unit can arrive on the battlefield as if it were the Reinforcements step of your Movement phase, and if every model in that unit has the Deep Strike ability, you can set that unit up as described in the Deep Strike ability (even though it is not your Movement phase).",
    restrictions: " You cannot use this Stratagem to enable a unit to arrive on the battlefield during a battle round it would not normally be able to do so in.",
      player_turn: 1
  }, {
    name: "Fire Overwatch",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "A hail of wildfire can drive back advancing foes.",
    when: "Your opponent’s Movement or Charge phase, just after an enemy unit is set up or when an enemy unit starts or ends a Normal, Advance or Fall Back move, or declares a charge.",
    target: "One unit from your army that is within 24\" of that enemy unit and that would be eligible to shoot if it were your Shooting phase.",
    effect: "If that enemy unit is visible to your unit, your unit can shoot that enemy unit as if it were your Shooting phase.",
    restrictions: "You cannot target a TITANIC unit with this Stratagem. Until the end of the phase, each time a model in your unit makes a ranged attack, an unmodified Hit roll of 6 is required to score a hit, irrespective of the attacking weapon’s Ballistic Skill or any modifiers. You can only use this Stratagem once per turn.",
    player_turn: 1
  }, {
    name: "Go To Ground",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Seeking salvation from incoming fire, warriors hurl themselves into whatever cover they can find.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Infantry unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, all models in your unit have a 6+ invulnerable save and have the Benefit of Cover.",
    keywords: [ "Infantry" ],
    player_turn: 1
  }, {
    name: "Smokescreen",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:wargear],
    flavour_text: "Even the most skilled marksmen struggle to hit targets veiled by billowing screens of smoke.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Smoke unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, all models in your unit have the Benefit of Cover and the Stealth ability.",
    keywords: [ "Smoke" ],
    player_turn: 1
  }, {
    name: "Heroic Intervention",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Voices raised in furious war cries, your warriors surge forth to meet the enemy’s onslaught head-on.",
    when: "Your opponent’s Charge phase, just after an enemy unit ends a Charge move.",
    target: "One unit from your army that is within 6\" of that enemy unit and would be eligible to declare a charge against that enemy unit if it were your Charge phase.",
    effect: "You can only select a Vehicle unit from your army if it is a Walker. Note that even if this charge is successful, your unit does not receive any Charge bonus this turn.",
    keywords: [ "Vehicle", "Walker" ],
    player_turn: 1
  }
]

create_core_strategems(core_strategems)

puts "Created Core Strategems and their StrategemKeywords successfully."
