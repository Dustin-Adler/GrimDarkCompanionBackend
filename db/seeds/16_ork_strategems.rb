puts "Creating Ork Strategems, StrategemKeywords, and ExcludedStrategemKeywords..."

def create_ork_strategems(strategems_arr)
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
    strategem[:excluded_keywords]&.each do |keyword|
      keyword_id = $keywords[keyword].id
      ExcludedStrategemKeyword.create({
        strategem_id: new_strat.id,
        keyword_id: keyword_id
      })
    end
  end
end

ork_strategems = [
  {
    detachment_id: "War Horde",
    name: "Careen!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "If their vehicle is on its last legs, any Ork worth their steering wheel will aim its blazing remains into the nearest cluster of enemies. The ensuing explosions never fail to raise a rousing cheer from nearby Ork onlookers.",
    when: "Any phase, just after an Orks Vehicle unit from your army with the Deadly Demise ability is destroyed.",
    target: "That destroyed Orks Vehicle unit, if you roll a 6 for its Deadly Demise ability. You can use this Stratagem on that unit even though it was just destroyed.",
    effect: "Your unit can make a Normal or Fall Back move before its Deadly Demise ability is resolved, and before any embarked units perform an Emergency Disembarkation. When making this move, your unit can move over enemy units (excluding Monsters and Vehicles) as if they were not there.",
    keywords: [ "Vehicle", "Orks" ],
    player_turn: 2
  }, {
    detachment_id: "War Horde",
    name: "Orks Is Never Beaten",
    cost: 2,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "So resilient is Ork physiology – and so slow are Orks on the uptake – that even killing wounds can take a while to register.",
    when: "Fight phase, just after an enemy unit has selected its targets.",
    target: "One Orks unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, each time a model in your unit is destroyed, if that model has not fought this phase, do not remove it from play. The destroyed model can fight after the attacking model’s unit has finished making attacks, and is then removed from play.",
    keywords: [ "Orks" ],
    player_turn: 2
  }, {
    detachment_id: "War Horde",
    name: "Unbridled Carnage",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "When Orks get stuck into the foe, the carnage is wonderful to behold, at least for other Orks.",
    when: "Fight phase",
    target: "One Orks unit from your army that has not been selected to fight this phase.",
    effect: "Until the end of the phase, each time a model in your unit makes a melee attack, an unmodified hit roll of 5+ scores a Critical Hit.",
    keywords: [ "Orks" ],
    player_turn: 2
  },   {
    detachment_id: "War Horde",
    name: "’Ard As Nails",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Even the lowliest Ork Boy has a toughened hide and a dense skull. While there yet remains the prospect of a git to give a good kicking, it takes a blow of truly phenomenal strength to even give the Ork pause.",
    when: "Your opponent’s Shooting phase or the Fight phase, just after an enemy unit has selected its targets.",
    target: "One ORKS unit from your army (excluding Grots, Monster and Vehicle units) that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, each time an attack targets your unit, subtract 1 from the Wound roll.",
    keywords: [ "Orks" ],
    excluded_keywords: [ "Monster", "Vehicle", "Grots" ],
    player_turn: 2
  }, {
    detachment_id: "War Horde",
    name: "Mob Rule",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "The more Orks that gather in one place the more the Waaagh! energy flows, and the more fearless they all become.",
    when: "Your Command phase.",
    target: "One Mob unit from your army that contains 10 or more models and is not Below Half-strength.",
    effect: "Select one friendly Battle-shocked ORKS INFANTRY unit within 6\" of that MOB unit. That ORKS INFANTRY unit is no longer Battle-shocked.",
    keywords: [ "Orks", "Mob" ],
    player_turn: 0
  }, {
    detachment_id: "War Horde",
    name: "Ere We Go",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "",
    when: "Start of your Movement phase.",
    target: "One Orks Infantry unit from your army.",
    effect: "Until the end of the turn, add 2 to Advance and Charge rolls made for your unit.",
    keywords: [ "Orks", "Infantry" ],
    player_turn: 0
  }, {
    detachment_id: "Da Big Hunt",
    name: "Drag It Down",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Beast Snaggas have many tales of the times they took on the biggest prey, clobbering them with so many blows that what was left was a crumpled mass of broken hide and squished innards.",
    when: "Fight phase.",
    target: "One Beast Snagga unit from your army that has not been selected to fight this phase.",
    effect: "Until the end of the phase, melee weapons equipped by models in your unit have the [SUSTAINED HITS 1] ability. In addition, each time a model in your unit makes a melee attack that targets your Prey, a Critical Hit is scored on an unmodified Hit roll of 5+, instead of only a 6.",
    keywords: [ "Orks", "Beast Snagga" ],
    player_turn: 2
  }, {
    detachment_id: "Da Big Hunt",
    name: "Unstoppable Momentum",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Smasha squigs are essentially battering rams on legs. Driven on by the squighogs piling in behind them, they plunge headlong into the foe, trampling one after the next.",
    when: "Your Charge phase, just after a Beast Snagga Mounted unit from your army ends a Charge move.",
    target: "That Beast Snagga unit.",
    effect: "Select one enemy unit within Engagement Range of your unit and roll one D6 for each model in your unit: for each 4+, that enemy unit suffers 1 mortal wound (to a maximum of 6 mortal wounds). If that enemy unit is your Prey, roll three additional D6.",
    keywords: [ "Orks", "Beast Snagga", "Mounted" ],
    player_turn: 0
  }, {
    detachment_id: "Da Big Hunt",
    name: "Dat One’S Even Bigga!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "When bigger prey is sighted, nothing can keep a mob of Beast Snaggas from it. A great hunting chant erupts, and lesser gitz are swiftly forgotten in the enthusiastic impetus to pile into a bigger challenge.",
    when: "Your Charge phase.",
    target: "One Beast Snagga unit from your army.",
    effect: "Until the end of the phase, your unit is eligible to charge in a turn in which it Advanced or Fell Back. In addition, you can re-roll Charge rolls made for your unit, provided one of the targets of that charge is your Prey.",
    keywords: [ "Orks", "Beast Snagga" ],
    player_turn: 0
  },   {
    detachment_id: "Da Big Hunt",
    name: "Where D’Ya Fink You’Re Going?",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Beast Snagga victims often make a break for it before the Orks have had their fill of fighting. With a roar, the Orks immediately give chase, or else lose interest and lunge after other potential trophies.",
    when: "Your opponent’s Movement phase, just after an enemy unit ends a Fall Back move.",
    target: "One Beast Snagga Infantry or Beast Snagga Mounted unit from your army that was within Engagement Range of that enemy unit at the start of the phase.",
    effect: "If your unit is not within Engagement Range of one or more enemy units, it can make a Normal move of up to 6\".",
    keywords: [ "Orks", "Beast Snagga", "Infantry", "Mounted" ],
    player_turn: 1
  }, {
    detachment_id: "Da Big Hunt",
    name: "Stalkin’ Taktiks",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "There is no hiding a Beast Snagga stampede, but the more agile amongst the hunters know how to evade the worst of an unsporting prey’s dakka.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Beast Snagga Infantry or Beast Snagga Mounted unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, each time a ranged attack targets your unit, models in your unit have the Benefit of Cover against that attack. In addition, if your unit has the Infantry keyword, until the end of the phase, models in your unit have the Stealth ability.",
    keywords: [ "Orks", "Beast Snagga", "Infantry", "Mounted" ],
    player_turn: 1
  }, {
    detachment_id: "Da Big Hunt",
    name: "Instinctive Hunters",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "With a keen eye for tracking their prey, especially kunnin' Beast Snaggas will circle round the hunt site to ambush the luckless gitz from another angle.",
    when: "End of your opponent’s Fight phase.",
    target: "One Beast Snagga unit from your army that is not within Engagement Range of one or more enemy unit.",
    effect: "Remove your unit from the battlefield and place it into Strategic Reserves.",
    keywords: [ "Orks", "Beast Snagga" ],
    player_turn: 1
  }, {
    detachment_id: "Kult of Speed",
    name: "Speediest Freeks",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Speed Freeks are often just blurs of vehicular mayhem that prove difficult to land a blow on.",
    when: "Your opponent’s Shooting phase or the Fight phase, just after an enemy unit has selected its targets.",
    target: "One Speed Freeks or Trukk unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, models in your unit have a 5+ invulnerable save. If your unit is a VEHICLE unit with an unmodified Toughness characteristic of 8 or less, until the end of the phase, models in your unit have a 4+ invulnerable save instead.",
    keywords: [ "Orks", "Speed Freeks", "Trukk" ],
    player_turn: 2
  }, {
    detachment_id: "Kult of Speed",
    name: "Squig Flingin’",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Speed Freeks live in their vehicles, so it's no surprise to find small squigs lurking in some compartments. A few are vicious, and entertaining, enough to be worth lobbing into nearby enemies to cause anarchy.",
    when: "Your Movement phase, just after a Speed Freeks or Trukk unit from your army ends a Normal, Advance or Fall Back move.",
    target: "That Speed Freeks or Trukk unit.",
    effect: "Select one enemy unit within 9\" of your unit. That enemy unit must take a Battle-shock test and, when doing so, subtract 1 from the result.",
    keywords: [ "Orks", "Speed Freeks", "Trukk" ],
    player_turn: 0
  }, {
    detachment_id: "Kult of Speed",
    name: "Dakkastorm",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Often all an enemy will see of a Kult of Speed is a blur as they speed by, all guns blazing.",
    when: "Your Shooting phase.",
    target: "One Speed Freeks unit from your army that has not been selected to shoot this phase.",
    effect: "Until the end of the phase, ranged weapons equipped by models in your unit have the [SUSTAINED HITS 1] ability. While targeting a unit within 9\", they have the [SUSTAINED HITS 2] ability instead.",
    restrictions: "A unit cannot be targeted by this and the Blitza Fire Stratagem in the same phase.",
    keywords: [ "Orks", "Speed Freeks" ],
    player_turn: 0
  },   {
    detachment_id: "Kult of Speed",
    name: "Blitza Fire",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Fiercely gripping the trigger, with a manic grin as they close on their foes, Speed Freeks fire so many rounds that some just have to find a weak spot.",
    when: "Your Shooting phase.",
    target: "One Speed Freeks unit from your army that has not been selected to shoot this phase.",
    effect: "Until the end of the phase, ranged weapons equipped by models in your unit have the [LETHAL HITS] ability and, each time a model in your unit makes an attack that targets a unit within 9\", a Critical Hit is scored on an unmodified Hit roll of 5+, instead of only a 6.",
    restrictions: "A unit cannot be targeted by this and the Dakkastorm Stratagem in the same phase.",
    keywords: [ "Orks", "Speed Freeks" ],
    player_turn: 0
  }, {
    detachment_id: "Kult of Speed",
    name: "Full Throttle!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "When racing buggies and warbikes charge at full pelt, the power behind their crews’ assault is so great that they can smash through the enemy.",
    when: "Your Charge phase, just after a Speed Freeks unit from your army ends a Charge move.",
    target: "That Speed Freeks unit.",
    effect: "Until the end of the turn, each time a model in your unit makes a melee attack, add 1 to the Wound roll.",
    keywords: [ "Orks", "Speed Freeks" ],
    player_turn: 0
  }, {
    detachment_id: "Kult of Speed",
    name: "More Gitz Over ’Ere!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Sometimes new targets that emerge are just too juicy to ignore.",
    when: "Your opponent’s Movement phase, just after an enemy unit ends a Normal, Advance or Fall Back move.",
    target: "One Speed Freeks unit from your army that is within 9\" of that enemy unit and is not within Engagement Range of one or more enemy units.",
    effect: "Your unit can make a Normal move of up to 6\".",
    keywords: [ "Orks", "Speed Freeks" ],
    player_turn: 1
  }, {
    detachment_id: "Dread Mob",
    name: "Klankin’ Klaws",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "The krews of a Mek’s stompiest contraptions revel in ripping apart anything they can get their kiaws on, heedless of the damage done to their own gubbinz.",
    when: "Fight phase",
    target: "One Orks Walker unit from your army that has not been selected to fight this phase.",
    effect: "Each time you use this Stratagem, you can choose to push it. Until the end of the phase, add 2 to the Strength characteristic of melee weapons equipped by models in your unit and, if you chose to push it, until the end of the phase, add 1 to the Damage characteristic of those weapons and they have the [HAZARDOUS] ability as well.",
    keywords: [ "Orks", "Walker" ],
    player_turn: 2
  }, {
    detachment_id: "Dread Mob",
    name: "Superfuelled Boiler",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "By pushing their engines past any sane level, Ork combat walkers can build terrifying momentum.",
    when: "Your Movement phase, just after an Orks Walker unit from your army has been selected to Advance.",
    target: "That Orks Walker unit.",
    effect: "Until the end of the turn, you can re-roll Advance rolls made for your unit and ranged weapons equipped by models in your unit have the [ASSAULT] ability.",
    keywords: [ "Orks", "Walker" ],
    player_turn: 0
  }, {
    detachment_id: "Dread Mob",
    name: "Bigger Shells For Bigger Gitz",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Stashes of extra speshul ammo provided by the Meks are often expended on rival monstrosities.",
    when: "Your Shooting phase.",
    target: "One Mek, Orks Walker or Grots Vehicle unit from your army that has not been selected to shoot this phase.",
    effect: "Each time you use this Stratagem, you can choose to push it. Until the end of the phase, each time a model in your unit makes an attack that targets a Monster or Vehicle, add 1 to the Wound roll. If you chose to push it, add 1 to the Damage characteristic of that attack and, until the end of the phase, ranged weapons equipped by models in your unit have the [HAZARDOUS] ability as well.",
    keywords: [ "Orks", "Walker", "Grots", "Vehicle", "Mek" ],
    player_turn: 0
  },   {
    detachment_id: "Dread Mob",
    name: "Dakka! Dakka! Dakka!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Orks have a tendency to hold the trigger down until their weapon stops firing, falls apart or misfires.",
    when: "Your Shooting phase.",
    target: "One Orks Walker or Grots Vehicle unit from your army that has not been selected to shoot this phase.",
    effect: "Each time you use this Stratagem, you can choose to push it. Until the end of the phase, each time a model in your unit makes an attack, re-roll a Hit roll of 1. If you chose to push it, you can re-roll the Hit roll instead and, until the end of the phase, ranged weapons equipped by models in your unit have the [HAZARDOUS] ability as well.",
    keywords: [ "Orks", "Walker", "Grots", "Vehicle" ],
    player_turn: 0
  }, {
    detachment_id: "Dread Mob",
    name: "Conniving Runts",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "A Gretchin’s lot is often a wretched one, and the spiteful zoggers will take any chance to cause pain and mischief using sneaky traps before legging it.",
    when: "Your opponent’s Movement phase, just after an enemy unit ends a Normal, Advance or Fall Back move.",
    target: "One Gretchin unit from your army that is within 9\" of that enemy unit and not within Engagement Range of any enemy units.",
    effect: "Roll one D6: on a 4+, that enemy unit suffers D3+1 mortal wounds. Your unit can then make a Normal move.",
    keywords: [ "Orks", "Gretchin" ],
    player_turn: 1
  }, {
    detachment_id: "Dread Mob",
    name: "Extra Gubbinz",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "The Meks' creations can afford to have all manner of useless junk blasted from them with little effect.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Orks Walker or Grots Vehicle unit from your army (excluding Titanic units) that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, each time an attack is allocated to a model in your unit, subtract 1 from the Damage characteristic of that attack.",
    keywords: [ "Orks", "Walker", "Grots", "Vehicle" ],
    excluded_keywords: [ "Titanic" ],
    player_turn: 1
  }, {
    detachment_id: "Green Tide",
    name: "Competitive Streak",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Galvanised by the rest of their mates fighting around them, Orks will redouble their efforts to outdo each other.",
    when: "Fight phase.",
    target: "One Boyz unit from your army that has not been selected to fight this phase.",
    effect: "Until the end of the phase, each time a model in your unit makes an attack, re-roll a Wound roll of 1. If your unit contains 10 or more models, re-roll the Wound roll instead.",
    keywords: [ "Orks", "Boyz" ],
    player_turn: 2
  }, {
    detachment_id: "Green Tide",
    name: "Bulldozer Brutality",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "In the massive fights that Orks enjoy, the only way to ensure a slice of the action is to bludgeon a path through the press to get a hand on the enemy.",
    when: "Fight phase.",
    target: "One Boyz unit from your army that has not been selected to fight this phase and is within Engagement Range of one or more enemy units.",
    effect: "Until the end of the phase, each time your unit is selected to fight, when determining which models in your unit are eligible to fight, any models in your unit that are within 3\" of one or more enemy models are eligible to fight. When resolving those attacks, such models can target one of those enemy units that is within 3\" of them and within Engagement Range of their unit.",
    keywords: [ "Orks", "Boyz" ],
    player_turn: 2
  }, {
    detachment_id: "Green Tide",
    name: "Braggin’ Rights",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "With volleys of wagers, threats, insults, dung and the occasional hurled rock, mobs of Orks bolster each other’s spirits in the most Orky ways possible.",
    when: "Your Command phase.",
    target: " Two Boyz units from your army that are within 6\" of each other.",
    effect: "Until the start of your next Command phase, while those two units are within 6\" of each other, they both count as containing 10 or more models for the purposes of your Detachment rule, any Enhancements models from your army have and any Stratagems you use.",
    keywords: [ "Orks", "Boyz" ],
    player_turn: 0
  }, {
    detachment_id: "Green Tide",
    name: "Come On Ladz!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Orks are drawn to conflict and constantly race into battle at the merest hint of violence.",
    when: "Your Command phase.",
    target: "One Boyz unit from your army.",
    effect: "Return up to D3+2 destroyed models to your unit (excluding Character models).",
    keywords: [ "Orks", "Boyz" ],
    excluded_keywords: [ "Character" ],
    player_turn: 0
  }, {
    detachment_id: "Green Tide",
    name: "Tide Of Muscle",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "Once a horde of Orks get a sight of the foe, nothing can stop them.",
    when: "Your Charge phase.",
    target: "One Boyz unit from your army that has not declared a charge this phase.",
    effect: "Until the end of the phase, each time your unit declares a charge, add 1 to the Charge roll and, if your unit contains 10 or more models, you can re-roll the Charge roll.’",
    keywords: [ "Orks", "Boyz" ],
    player_turn: 0
  }, {
    detachment_id: "Green Tide",
    name: "Go Get ’Em!",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Keeping Orks at arm’s length and pummelling them with as much firepower as possible is often the safest tactic for their victims. Unfortunately, it can also draw their attention and give them the urge to re-educate the gitz in the joys of up-close savagery.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Boyz unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "After the attacking unit has shot, your unit can make a Go Get ’Em! move. To do so, roll one D6: each model in your unit can move a distance in inches up to the result, but your unit must end that move as close as possible to the closest enemy unit. When doing so, those models can be moved within Engagement Range of that enemy unit. If your unit contains 10 or more models, you can re-roll the D6 to determine how far your unit can move.",
    keywords: [ "Orks", "Boyz" ],
    player_turn: 1
  }, {
    detachment_id: "Bully Boyz",
    name: "Armed To Dateef",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Nobz load themselves with all manner of weapons in shows of wealth and influence, enabling them to smash the foe with a ceaseless barrage of attacks.",
    when: "Your Shooting phase or the Fight phase.",
    target: "One Nobz or Meganobz unit from your army that has not been selected to shoot or fight this phase.",
    effect: "Until the end of the phase, each time a model in your unit makes an attack, re-roll a Hit roll of 1. If a Waaagh! is active for your unit, you can re-roll the Hit roll instead.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 2
  }, {
    detachment_id: "Bully Boyz",
    name: "Too Arrogant To Die",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "With bone-headed arrogance, Nobz will carry on killing before their deaths finally register.",
    when: "Your opponent’s Shooting phase or the Fight phase, just after an enemy unit has selected its targets.",
    target: "One Nobz or Meganobz unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the end of the phase, each time a model in your unit is destroyed, if that model has not shot or fought this phase, roll one D6, adding 2 to the result if a Waaagh! is active for your unit. On a 5+, do not remove the destroyed model from play; it can shoot or fight after the attacking unit has finished making its attacks, and is then removed from play.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 2
  }, {
    detachment_id: "Bully Boyz",
    name: "Always Lookin’ Fer A Fight",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "As one enemy falls to the choppas of a battle-hungry mob of Nobz, they immediately seek out more.",
    when: "Fight phase, just after an enemy unit is destroyed.",
    target: "One Nobz or Meganobz unit from your army that destroyed that enemy unit.",
    effect: "Until the end of the phase, each time your unit makes a Consolidation move, it can move up to D3+3\" instead of up to 3\". If a Waaagh! is active for your unit, it can move up to 6\" instead.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 2
  },   {
    detachment_id: "Bully Boyz",
    name: "Crushing Impact",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "When a thundering mob of hulking Ork Nobz stampedes into the foe, their crushing momentum is a lethal weapon by itself.",
    when: "Your Charge phase, just after a Nobz or Meganobz unit from your army ends a Charge move.",
    target: "That Nobz or Meganobz unit.",
    effect: "Select one enemy unit within Engagement Range of your unit, then roll one D6 for each model in your unit that is within Engagement Range of that enemy unit: for each 5+, that enemy unit suffers 1 mortal wound (to a maximum of 6 mortal wounds). If a Waaagh! is active for your unit, that enemy unit suffers 1 mortal wound for each 4+ instead.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 0
  }, {
    detachment_id: "Bully Boyz",
    name: "Cut’Em Down",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Furious with any snivelling gitz who attempt to back away from a good fight, Nobz will ruthlessly hack them apart as they turn to flee.",
    when: "Your opponent’s Movement phase, just after an enemy unit is selected to Fall Back.",
    target: "One Nobz or Meganobz unit from your army within Engagement Range of that enemy unit.",
    effect: "When that enemy unit Falls Back, all models in that enemy unit must take a Desperate Escape test. When doing so, if a Waaagh! is active for your unit, subtract 1 from each of those tests.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 1
  }, {
    detachment_id: "Bully Boyz",
    name: "Hulking Brutes",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "The sheer aggressive contempt advancing Nobz project, not to mention their thick skulls and ‘eavy armour, make them a terrifying prospect for foes desperately trying to gun them down.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has selected its targets.",
    target: "One Nobz or Meganobz unit from your army that was selected as the target of one or more of the attacking unit’s attacks.",
    effect: "Until the attacking unit has finished making its attacks, each time an attack targets your unit, worsen the Armour Penetration characteristic of that attack by 1.",
    keywords: [ "Orks", "Nobz", "Meganobz" ],
    player_turn: 1
  }, {
    detachment_id: "Taktikal Brigade",
    name: "Dat’s Ours",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "A few Orks, particularly those of the Blood Axe Clan, can resist their destructive urges long enough to prioritise the seizing of objectives.",
    when: "Command phase.",
    target: "One Orks unit from your army that is within Engagement Range of one or more enemy units.",
    effect: "Until the start of the next Command phase, add 1 to the Objective Control characteristic of models in your unit.",
    keywords: [ "Orks" ],
    player_turn: 2
  }, {
    detachment_id: "Taktikal Brigade",
    name: "Fight Proppa",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Some deviant Blood Axes go so far as to practise hand-to-hand combat, tailoring fighting styles to specific types of enemies.",
    when: "Fight phase.",
    target: "One Orks Infantry or Orks Mounted unit from your army that has not been selected to fight this phase.",
    effect: "Select the [SUSTAINED HITS 1] or [LETHAL HITS] ability. Until the end of the phase, melee weapons equipped by models in your unit have the selected ability.",
    keywords: [ "Orks", "Infantry", "Mounted" ],
    player_turn: 2
  }, {
    detachment_id: "Taktikal Brigade",
    name: "Taktikal Retreat",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Blood Axes feel no shame in retreating from a fight, particularly if the boss wants someone else duffed up.",
    when: "Your Movement phase, just after an Orks unit from your army Falls Back.",
    target: "That Orks unit.",
    effect: "Until the end of the turn, your unit is eligible to shoot and declare a charge in a turn in which it Fell Back.",
    keywords: [ "Orks" ],
    player_turn: 0
  },   {
    detachment_id: "Taktikal Brigade",
    name: "Krunchin’ Descent",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "With their rocket packs at full throttle, Stormboyz plummet to smash into their foes with bone-crushing force.",
    when: "Your Charge phase, just after a Stormboyz unit from your army ends a Charge move.",
    target: "That Stormboyz unit.",
    effect: "Select one enemy unit within Engagement Range of your unit, then roll one D6 for each model in your unit that is within Engagement Range of that enemy unit: for each 4+, that enemy unit suffers 1 mortal wound (to a maximum of 6 mortal wounds).",
    keywords: [ "Orks", "Stormboyz" ],
    player_turn: 0
  }, {
    detachment_id: "Taktikal Brigade",
    name: "On To Da Next",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Seeing little value in pursuing fleeing foes, Blood Axe mobs turn their attention towards the next fight or press towards whatever cache of shiny gubbinz the boss desires.",
    when: "Your opponent’s Movement phase, just after an enemy unit Falls Back.",
    target: "One Orks unit from your army that was within Engagement Range of that enemy unit at the start of the phase.",
    effect: "Your unit can make a Normal move of up to 6\".",
    keywords: [ "Orks" ],
    player_turn: 1
  }, {
    detachment_id: "Taktikal Brigade",
    name: "Ded Sneaky",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Utilising camouflage, cover or misdirection, these Orks slip away to prepare their next ambush, leaving their foes staring at thin air.",
    when: "End of your opponent’s Fight phase.",
    target: "One Kommandos or Stormboyz unit from your army that is not within Engagement Range of one or more enemy units.",
    effect: "Remove your unit from the battlefield and place it into Strategic Reserves.",
    keywords: [ "Orks", "Kommandos", "Stormboyz" ],
    player_turn: 1
  }, {
    detachment_id: "More Dakka!",
    name: "Orks Is Still Orks",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "Even though they may be armed with the flashiest shootas, when enemies stray within arms reach, an Orks first and strongest instinct is to use their snazzy shoota as a cudgel, and bash their foe to a pulp.",
    when: "Fight phase.",
    target: "One Orks unit from your army that has not been selected to fight this phase.",
    effect: "Until the end of the phase, each time a model in your unit makes an attack that targets an enemy unit, re-roll a Wound roll of 1. If that enemy unit is within range of an objective marker, you can re-roll the Wound roll instead.",
    keywords: [ "Orks" ],
    player_turn: 2
  }, {
    detachment_id: "More Dakka!",
    name: "Get Stuck In, Ladz!",
    cost: 2,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "Lashing out with ferocious blows and bellowing loud enough to burst eardrums, the biggest Ork present persuades his ladz to fight even harder.",
    when: "Your Command phase.",
    target: "One Orks unit from your army (excluding Gretchin units).",
    effect: "Until the start of your next Command phase, the Waaagh! is active for your unit, even if you have already called a Waaagh! this battle.",
    keywords: [ "Orks" ],
    excluded_keywords: [ "Gretchin" ],
    player_turn: 0
  }, {
    detachment_id: "More Dakka!",
    name: "Huge Show-Offs",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:epic_deed],
    flavour_text: "The pilots of the biggest Orky war machines are prone to showing off when the dakka starts flying. After all, they have a reputation to uphold.",
    when: "Your Command phase.",
    target: "One Orks Walker unit (excluding Killa Kans) from your army.",
    effect: "Until the start of your next Command phase, improve your unit’s Move, Leadership and Objective Control characteristics by 1, and each time a model in your unit makes an attack, add 1 to the Hit roll.",
    keywords: [ "Orks", "Walker" ],
    excluded_keywords: [ "Killa Kans" ],
    player_turn: 0
  },   {
    detachment_id: "More Dakka!",
    name: "Long, Uncontrolled Bursts",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:battle_tactic],
    flavour_text: "When facing off against sneaky gitz who like to lurk in cover, most Orks believe the most effective strategy is to fire off so many bullets and munitions that something is bound to hit the target.",
    when: "Your Shooting phase.",
    target: "One Orks unit from your army that has not been selected to shoot this phase.",
    effect: "Until the end of the phase, ranged weapons equipped by models in your unit have the [IGNORES COVER] ability.",
    keywords: [ "Orks" ],
    player_turn: 0
  }, {
    detachment_id: "More Dakka!",
    name: "Speshul Shells",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:wargear],
    flavour_text: "Nothing helps a round punch through armour better than stuffing it full of extra propellant.",
    when: "Your Shooting phase.",
    target: "One Orks unit from your army that has not been selected to shoot this phase.",
    effect: "Until the end of the phase, each time a model in your unit makes a ranged attack that targets the closest eligible target within 18\", improve the Armour Penetration characteristic of ranged weapons equipped by models in your unit by 1.",
    keywords: [ "Orks" ],
    player_turn: 0
  }, {
    detachment_id: "More Dakka!",
    name: "Call Dat Dakka?",
    cost: 1,
    category: STRATEGEM_CATEGORIES[:strategic_ploy],
    flavour_text: "Gun-crazed mobs of Orks take incoming fire as a primal challenge, one that must be answered with an even bigger show of dakka.",
    when: "Your opponent’s Shooting phase, just after an enemy unit has shot.",
    target: "One Orks unit from your army that had one or more of its models destroyed as a result of the attacking unit’s attacks.",
    effect: "Your unit can shoot as if it were your Shooting phase, but must target only that enemy unit when doing so, and can only do so if that enemy unit is an eligible target.",
    keywords: [ "Orks" ],
    player_turn: 1
  }
]

create_ork_strategems(ork_strategems)

puts "Created Ork Strategems, StrategemKeywords, and ExcludedStrategemKeywords successfully."
