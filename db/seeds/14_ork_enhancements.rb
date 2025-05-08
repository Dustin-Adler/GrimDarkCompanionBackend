puts "Creating Ork Enhancements and Ork EnhancementKeywords..."

def create_enhancement_keywords(enhancement_id, enhancement_keywords_arr)
  keyword_ids = enhancement_keywords_arr.map { |keyword| $keywords[keyword].id }
  keyword_ids.each do |keyword_id|
    EnhancementKeyword.create({
      enhancement_id: enhancement_id,
      keyword_id: keyword_id
    })
  end
end

def create_enhancements(ork_enhancements)
  ork_enhancements.each do |enhancement|
    puts "Failed to create #{enhancement[:name]}..." unless $ork_detachments[enhancement[:detachment_id]]
    detachment_id = $ork_detachments[enhancement[:detachment_id]].id
    new_enhancement = Enhancement.create({
      detachment_id: detachment_id,
      cost: enhancement[:cost],
      name: enhancement[:name],
      flavour_text: enhancement[:flavour_text],
      rule: enhancement[:rule]
    })
    create_enhancement_keywords(new_enhancement.id, enhancement[:keywords])
  end
end

ork_enhancements = [
  {
    cost: 25,
    name: "Follow Me Ladz",
    flavour_text: "Always found at the forefront of an assault, this Ork likes to be the first into the fray.",
    rule: "Orks model only. While the bearer is leading a unit, add 2\" to the Move characteristic of models in that unit.",
    detachment_id: "War Horde",
    keywords: [ "Orks" ]
  }, {
    cost: 20,
    name: "Headwoppa’s Killchoppa",
    flavour_text: "Grand Warboss Headwoppa and his tribe were last seen charging headlong into a horde of Khornate daemons, but legend speaks of a blood-slick choppa that still turns up occasionally. Though this weapon looks normal, a dark voice is said to growl in the mind of its wielder, driving them on to ever greater excesses of violence.",
    rule: "Orks model only. Melee weapons equipped by the bearer (excluding Extra Attacks weapons) have the [DEVASTATING WOUNDS] ability.",
    detachment_id: "War Horde",
    keywords: [ "Orks" ]
  }, {
    cost: 15,
    name: "Kunnin’ But Brutal",
    flavour_text: "Feigning weakness, this greenskin allows his foes to close in before delivering a brutal flurry of attacks.",
    rule: "Orks model only. While the bearer is leading a unit, that unit is eligible to shoot and declare a charge in a turn in which it Fell Back.",
    detachment_id: "War Horde",
    keywords: [ "Orks" ]
  }, {
    cost: 15,
    name: "Supa-Cybork Body",
    flavour_text: "The original owner of this one-of-a-kind endoskeleton became the envy of every Warboss around, and was soon gutted and stripped for parts by a stronger rival. The Supa-Cybork Body has been retransplanted several times since then, filling its new owner with confidence, resilience and a belated hope that the Painboyz gave it a quick clean before shoving it back in place…",
    rule: "Orks model only. The bearer has the Feel No Pain 4+ ability.",
    detachment_id: "War Horde",
    keywords: [ "Orks" ]
  },   {
    cost: 30,
    name: "Glory Hog",
    flavour_text: "Obsessed with being the first to make a kill, this hunter spurs his unruly mount ahead of the warband, coaxing his mob to follow him with the explicit threat of feeding them to his squigosaur if they don’t keep up.",
    rule: "Beastboss On Squigosaur model only. Models in the bearer’s unit have the Scouts 9\" ability.",
    detachment_id: "Da Big Hunt",
    keywords: [ "Beastboss On Squigosaur" ]
  }, {
    cost: 15,
    name: "Proper Killy",
    flavour_text: "This Beast Snagga is an unstoppable engine of destructive butchery who has left the brutalised corpses of his huge prey piled in his wake on world after world.",
    rule: "Beast Snagga model only. Add 1 to the Damage characteristic of melee weapons equipped by the bearer.",
    detachment_id: "Da Big Hunt",
    keywords: [ "Beast Snagga" ]
  }, {
    cost: 25,
    name: "Skrag Every Stash!",
    flavour_text: "Successful hunt leaders are never short of a kunnin' plan to flush out the prey. This sneaky git has mastered the art of ransacking whatever the prey values, luring the quarry in to retaliate or else ensuring they’re cornered, with no bolthole or gear to fall back on.",
    rule: "BEAST SNAGGA model only. At the end of your Command phase, if the bearer is within range of an objective marker you control, that objective marker remains under your control, even if you have no models within range of it, until your opponent controls it at the start or end of any turn.",
    detachment_id: "Da Big Hunt",
    keywords: [ "Beast Snagga" ]
  }, {
    cost: 20,
    name: "Surly as a Squiggoth",
    flavour_text: "With a lifetime of leading notoriously deadly Beast Snagga hunts behind them, and gnarled hides thicker than Battlewagon armour, this Ork and his favoured Boyz have survived blows that would fell a Gargant.",
    rule: "Beastboss On Squigosaur model only. While the bearer is leading a unit, each time an attack targets that unit, if the Strength characteristic of that attack is greater than the Toughness characteristic of the bearers unit, subtract 1 from the Wound roll.",
    detachment_id: "Da Big Hunt",
    keywords: [ "Beastboss On Squigosaur" ]
  }, {
    cost: 35,
    name: "Fasta Than Yooz",
    flavour_text: "The thrill-seeking Orks at the head of Speed Freeks warbands lead their Kult of Speed brethren right into enemy lines, leaping from speeding Trukks and Battlewagons if need be to plunge into the fight.",
    rule: "Orks Infantry model only. Each time the bearer’s unit disembarks from a TRANSPORT after that TRANSPORT has made a Normal move, the bearer’s unit is still eligible to declare a charge this turn.",
    detachment_id: "Kult of Speed",
    keywords: [ "Orks", "Infantry" ]
  }, {
    cost: 25,
    name: "Speed Makes Right",
    flavour_text: "This Orks adrenaline-addled mind lurches from one insight to the next, a bone-shaker whose engine only fires on all cylinders when he is in the thick of the fighting. Once there, however, it revs into overdrive.",
    rule: "Orks model only. In your Command phase, if the bearer (or a TRANSPORT the bearer is embarked within is within 9\" of one or more enemy units, roll one D6: on a 3+, you gain 1CP.",
    detachment_id: "Kult of Speed",
    keywords: [ "Orks" ]
  }, {
    cost: 15,
    name: "Squig-hide Tyres",
    flavour_text: "Scaly squig-hide is the perfect material for fast and grippy tyres, able to provide traction even in the mire of blood, guts and oil left over from most Speed Freekfights.",
    rule: "Deffkilla Wartrike model only. Each time a model in the bearer’s unit makes a Consolidation move, it can move up to 6\" instead of up to 3\".",
    detachment_id: "Kult of Speed",
    keywords: [ "Deffkilla Wartrike" ]
  }, {
    cost: 10,
    name: "Wazblasta ",
    flavour_text: "This warlord’s fanatical devotion to speed is such that he cannot stand being anywhere other than in the hear, of the action and he pushes the ladz around him to crank their throttles in order to close the distance with the enemy as soon as possible.",
    rule: "Deffkilla Wartrike model only. In your Shooting phase, after the bearer’s unit has shot, if it is not within Engagement Range of one or more enemy units, it can make a Normal move of up to 6\". If it does, until the end of the turn, it is not eligible to declare a charge.",
    detachment_id: "Kult of Speed",
    keywords: [ "Deffkilla Wartrike" ]
  }, {
    cost: 10,
    name: "Gitfinder Googlez",
    flavour_text: "By squinting hard through the mismatched lenses of these goggles, even the sneakiest git can be pinpointed.",
    rule: "Mek model only. Ranged weapons equipped by models in the bearer’s unit have the [ignores cover] ability.",
    detachment_id: "Dread Mob",
    keywords: [ "Mek" ]
  }, {
    cost: 35,
    name: "Press It Fasta!",
    flavour_text: "Impatient for better results, this Mek is an avid advocate of the theory that smashing buttons and cranking dials faster makes kustom guns more shooty.",
    rule: "Mek model only. Each time the bearer’s unit is selected to shoot, when rolling to determine which ability that unit’s weapons gain from the Try Dat Button! Detachment rule, roll one additional D6: until the end of the phase, ranged weapons equipped by models in that unit gain both Button Effects generated by those rolls. If a duplicate Button Effect is rolled, it has no additional effect.",
    detachment_id: "Dread Mob",
    keywords: [ "Mek" ]
  }, {
    cost: 15,
    name: "Smoky Gubbinz",
    flavour_text: "This loud, fume-belching device wreathes the bearer and his mates in a thick bank of smoke. This is hard for the enemy to see through, but has little detriment on the Orks’ own accuracy.",
    rule: "Mek model only. Models in the bearer’s unit have the Stealth ability.",
    detachment_id: "Dread Mob",
    keywords: [ "Mek" ]
  }, {
    cost: 20,
    name: "Supa-glowy Fing",
    flavour_text: "The Mek cobbled together this strange device in a flash of feverish inventin’. He isn’t sure what it does - and it glows weirdly - but he proudly carries it to battle, eager to know what its big switch will do this time.",
    rule: "Mek model only. In your Command phase, select one enemy unit within 18\" of and visible to the bearer, then roll one D6: on a 1-2, that enemy unit must take a Battle-shock test; on a 3-4, that enemy unit suffers D3 mortal wounds; on a 5-6, until the start of your next Command phase, each time a model in that enemy unit makes an attack, subtract 1 from the Hit roll.",
    detachment_id: "Dread Mob",
    keywords: [ "Mek" ]
  }, {
    cost: 15,
    name: "Bloodthirsty Belligerence",
    flavour_text: "Buoyed on by his chanting ladz and eager to smash into his enemies first, this boss leads the way, racing towards one fight after the next.",
    rule: "Orks Infantry model only. While the bearer is leading a unit, you can re-roll Advance rolls made for that unit. While that unit contains 10 or more models, you can re-roll Charge rolls made for that unit as well.",
    detachment_id: "Green Tide",
    keywords: [ "Orks", "Infantry" ]
  }, {
    cost: 25,
    name: "Brutal But Kunnin’",
    flavour_text: "What tactics occasionally pop into this Orks head revolve purely around throwing as many Boyz into the enemy’s face as possible.",
    rule: "Orks Infantry model only. In your Command phase, if the bearer is on the battlefield (or is embarked within a TRANSPORT that is on the battlefield), roll one D6, adding 2 to the result if the bearer’s unit contains 10 or more models: on a 5+, you gain 1CP.",
    detachment_id: "Green Tide",
    keywords: [ "Orks", "Infantry" ]
  }, {
    cost: 10,
    name: "Ferocious Show Off",
    flavour_text: "This brutal fighter is even more dangerous with a raucous audience of chanting Orks as he displays his violent abilities as a warning to all.",
    rule: "Orks Infantry model only. Each time the bearer fights, while resolving those attacks, add 1 to the Strength characteristic of the bearers melee weapons. If the bearer’s unit contains 10 or more models, while resolving those attacks, add 3 to the Strength characteristic instead.",
    detachment_id: "Green Tide",
    keywords: [ "Orks", "Infantry" ]
  }, {
    cost: 20,
    name: "Raucous Warcaller",
    flavour_text: "This hulking boss is a focal point of violent enthusiasm. Orks flocking to his bosspole feel emboldened, the boss exuding an energetic dynamism that keeps his ladz at the height of rampaging excitement.",
    rule: "Orks Infantry model only. While the bearer is leading a unit, that unit always counts as containing 10 or more models for the purposes of your Detachment rule and any Stratagems you use.",
    detachment_id: "Green Tide",
    keywords: [ "Orks", "Infantry" ]
  }, {
    cost: 20,
    name: "Big Gob",
    flavour_text: "This warlords bellowing war cry is so loud that it can be heard over the thickest of fighting, rolling outwards in a terrifying bestial roar.",
    rule: "Infantry Warboss model only. At the start of the Fight phase, select one enemy unit within Engagement range of the bearer. That unit must take a Battle-shock test, and when doing so, subtract 1 from the result.",
    detachment_id: "Bully Boyz",
    keywords: [ "Infantry", "Warboss" ]
  }, {
    cost: 15,
    name: "Da Biggest Boss",
    flavour_text: "The bigger the Waaagh!, the bigger the boss must be to exert control. This Ork has countless huge battles under his belt and has grown in stature and aggression to match.",
    rule: "Infantry Warboss model only. Add 2 to the bearer’s Wounds characteristic.",
    detachment_id: "Bully Boyz",
    keywords: [ "Infantry", "Warboss" ]
  }, {
    cost: 10,
    name: "’Eadstompa",
    flavour_text: "A solid slab of muscle and aggression, this Ork is living embodiment of the undeniable truth of his enemies’ inferiority.",
    rule: "Infantry Warboss model only. Each time the bearer makes an attack that targets a unit that is below its Starting Strength, re-roll a Wound roll of 1. If that unit is Below Half-strength, you can re-roll the Wound roll instead.",
    detachment_id: "Bully Boyz",
    keywords: [ "Infantry", "Warboss" ]
  }, {
    cost: 25,
    name: "Tellyporta",
    flavour_text: "Nothing shocks the enemy like an angry mob of the biggest and surliest Orks imaginable suddenly appearing in a blast of green lightning!",
    rule: "Warboss In Mega Armour model only. Models in the bearer’s unit have the Deep Strike ability.",
    detachment_id: "Bully Boyz",
    keywords: [ "Warboss In Mega Armour" ]
  }, {
    cost: 15,
    name: "Skwad Leader",
    flavour_text: "An exemplar of the Blood Axes’ devious arts, this Warboss leads mobs of cunning Kommandos to battle.",
    rule: "Warboss Infantry model only. During the Declare Battle Formations step, the bearer can be attached to a KOMMANDOS unit. While leading a Kommandos unit, it has the Infiltrators and Stealth abilities.",
    detachment_id: "Taktikal Brigade",
    keywords: [ "Warboss", "Infantry" ]
  }, {
    cost: 45,
    name: "Mek Kaptin",
    flavour_text: "Whilst Flash Gitz hate discipline of any sort, particularly militant Meks can keep them in line with a combination of brutal discipline and the promise of shiny gubbinz.",
    rule: "Big Mek, Big Mek In Mega Armour or Big Mek With Shokk Attack Gun model only. During the Declare Battle Formations step, the bearer can be attached to a Flash Gitz unit. Each time a model in the bearer’s unit makes a ranged attack, you can re-roll the Hit roll.",
    detachment_id: "Taktikal Brigade",
    keywords: [ "Big Mek With Shokk Attack Gun", "Big Mek", "Big Mek In Mega Armour" ]
  }, {
    cost: 15,
    name: "Mork’s Kunnin’",
    flavour_text: "Possessed of an exceptionally keen mind – for an Ork at least – this boss matches wits with his opponents, holding his ladz back until an opportune moment arrives.",
    rule: "Orks model only. After both players have deployed their armies, select up to three ORKS units from your army and redeploy them. When doing so, you can set those units up in Strategic Reserves, regardless of how many units are already in Strategic Reserves.",
    detachment_id: "Taktikal Brigade",
    keywords: [ "Orks" ]
  }, {
    cost: 10,
    name: "Gob Boomer",
    flavour_text: "Cobbled together from the remains of a humie vox-caster, this device amplifies this Ork’s already booming voice, carrying their bellowed orders further",
    rule: "Warboss or Mek model only. Each time the bearer issues Taktiks, it can do so to a friendly Orks Infantry or Orks Mounted unit within 18\", instead of 6\".",
    detachment_id: "Taktikal Brigade",
    keywords: [ "Warboss", "Mek" ]
  }, {
    cost: 15,
    name: "Da Gobshot Thunderbuss",
    flavour_text: "Requiring an entire chest of teef to be loaded into its breach before each shot, the Gobshot Thunderbuss’ worky gubbinz plates its unconventional ammunition in gold before firing it in an inescapable cone of fanged death. Not only can this madcap weapon sweep away swathes of enemies with every shot, it also fires a literal fortune in teef every time, proclaiming its owner’s obscene wealth in the process.",
    rule: "Orks model only. Ranged weapons equipped by the bearer have the [DEVASTATING WOUNDS] and [HAZARDOUS] abilities.",
    detachment_id: "More Dakka!",
    keywords: [ "Orks" ]
  }, {
    cost: 35,
    name: "Dead Shiny Shootas",
    flavour_text: "Rumoured to have been made by Big Mek Buzzgob, da Dead Shiny Shootas are a set of multi-barrelled brutes packed full of dakka. The guns kick out a deafening storm of hot lead, much to the enjoyment of the Orks pulling the triggers, their volume of fire so great that even the most inaccurate shooter can land a respectable number of hits.",
    rule: "Orks model only. Ranged weapons equipped by models in the bearer’s unit have the [RAPID FIRE 1] ability.",
    detachment_id: "More Dakka!",
    keywords: [ "Orks" ]
  }, {
    cost: 15,
    name: "Targetin’ Squigs",
    flavour_text: "The flashiest gitz have specially-bred targetin’ squigs mounted atop their favourite shoota. It’s not certain whether these creatures actually aid the bearer or not as they cling for dear life atop their perches, which are inevitably the biggest shoota the owner has, as nothing aids accuracy like firing so many shots that you just can’t miss.",
    rule: "Orks model only. Each time a model in the bearer’s unit makes a ranged attack, add 1 to the Hit roll.",
    detachment_id: "More Dakka!",
    keywords: [ "Orks" ]
  }, {
    cost: 10,
    name: "Zog Off and Eat Dakka!",
    flavour_text: "There’s no point in having the loudest and flashiest shoota if gitz don’t let ya fire them. This Ork will even go so far as to avoid a punch up in order to fire his snazzy weapons.",
    rule: "Orks model only. The bearer’s unit is eligible to shoot in a turn in which it Fell Back.",
    detachment_id: "More Dakka!",
    keywords: [ "Orks" ]
  }
]

create_enhancements(ork_enhancements)

puts "Ork Enhancements and EnhancementKeywords created successfully."
