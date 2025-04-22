# create_table "models", force: :cascade do |t|
#     t.string "name", null: false
#     t.string "description", null: false
#     t.integer "movement", null: false
#     t.integer "army_id", null: false
#     t.integer "cost", null: false
#     t.integer "min_squad", null: false
#     t.integer "max_squad", null: false
#     t.integer "unit_limit", null: false
#     t.integer "toughness", null: false
#     t.integer "armour_save", null: false
#     t.integer "invuln_save", null: false
#     t.integer "wounds", null: false
#     t.integer "leadership", null: false
#     t.integer "obj_control", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["army_id"], name: "index_models_on_army_id"
#   end


# Looks like I might have to go back and change the cost of all of the models to reflect the per-model cost instead of the squad cost.

orks_army_id = Army.find_by(name: "Orks").id

Model.create({
    name: "Beastboss",
    description: "It takes a ferocious and foul-tempered Ork to lead a stampede of Beast Snaggas. Beastbosses possess these qualities in abundance. 
        Boasting cybork enhancements, wired-in targetin’ squigs and an array of brutal combat weaponry, these roaring monsters can bring down even the largest prey one-on-one.",
    movement: 6,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 5,
    wounds: 6,
    leadership: 6,
    obj_control: 1
})

Model.create({
    name: "Beastboss On Squigosaur",
    description: "Beastbosses have the strength and violent temperament to subdue the most ferocious creatures.
         Squiqosaurs, meanwhile, are single-minded predators that can bite through adamantine and shrug off enemg fire as though they were armour-plated.
         If a Beostboss wishes to ride one he must first beat it within an inch of its life to teach it respect, all without getting devoured in the process.",
    movement: 10,
    army_id: orks_army_id,
    cost: 130,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 8,
    armour_save: 3,
    invuln_save: 5,
    wounds: 8,
    leadership: 6,
    obj_control: 3
})

Model.create({
    name: "Big Mek",
    description: "Big Meks build all sorts of powerful weapons and bizarre devices. They readily bring theirfavourites into battle to test ’em out,
         even building and wearing a bionik exoskeleton to help them wield os many os possible. So equipped, the Big Mek unleashes mechanical violence and blasts of energy,
          or wrenches open warp tunnels down which he and his followers pile into the fight.",
    movement: 6,
    army_id: orks_army_id,
    cost: 70,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 3,
    invuln_save: 0,
    wounds: 6,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Big Mek In Mega Armour",
    description: "For all that its weight is akin to wearing half a tank, mega armour is incredibly resilient. 
        Big Meks often build and wear it, adding unstable kustom weaponry, force field projectors, 
        crushing klaws or even tellyport blastas that kill victims by beaming their component parts across a wide area, much to the Orks’ amusement.",
    movement: 5,
    army_id: orks_army_id,
    cost: 90,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 6,
    armour_save: 2,
    invuln_save: 0,
    wounds: 5,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Big Mek With Shokk Attack Gun",
    description: "Big Meks are basically clusters of insane but highly destructive weaponry. Amongst the strangest devices that some lug to battle is the shokk attack gun which opens a tunnel through the warp to its target, then launches screaming Snotlings down it. The ammunition rematerializes as a terror-maddened, clawing, biting swarm. If this happens inside the target, the results are swift and horrific.",
    movement: 6,
    army_id: orks_army_id,
    cost: 75,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 5,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Boss Snikrot",
    description: "Boss Snikrot is a murderous ghost whose obsession with kommando warfare has seen him transcend the cunning of his fellow Blood Axes and achieve instead something nigh supernatural. By the time his terrified foes realise he is upon them, the Boss is already opening their throats with his rip-toothed blades.",
    movement: 6,
    army_id: orks_army_id,
    cost: 95,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 5,
    wounds: 6,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Deffkilla Wartrike",
    description: "Ork Speedbosses thunder into battle on the backs of Deffkilla Wartrikes. These hurtling three-wheelers boast massive jet engines that fry the foe to a crisp while roaring through their ranks. Wartrikes also offer platforms from which the Speedbosses can messily chainhaul unfortunate foes with their grapnel-like snagga klaws.",
    movement: 12,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 6,
    armour_save: 4,
    invuln_save: 5,
    wounds: 9,
    leadership: 6,
    obj_control: 3
})

Model.create({
    name: "Ghazghkull Thraka",
    description: "To face Ghazghkull Thraka in battle is to die. Messily. He is a totemic war leader of great kunnin’ and terrifying presence who enjoys the personal protection of the Ork gods, not that he seems to need it!",
    movement: 5,
    army_id: orks_army_id,
    cost: 235,
    min_squad: 2,
    max_squad: 2,
    unit_limit: 1,
    toughness: 6,
    armour_save: 2,
    invuln_save: 4,
    wounds: 10,
    leadership: 6,
    obj_control: 4
})

Model.create({
    name: "Makari",
    description: "Makari bears aloft the personal Waaagh! banner of Ghazghkull. There isn’t a greenskin living who doesn’t fight harder in sight of that flag.",
    movement: 5,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 2,
    max_squad: 2,
    unit_limit: 1,
    toughness: 6,
    armour_save: 7,
    invuln_save: 2,
    wounds: 1,
    leadership: 8,
    obj_control: 1
})

Model.create({
    name: "Mek",
    description: "Any Mekboy worth his spanners knows how to patch and repair greenskin vehicles, artillery pieces and the like even amidst the fury of combat. Meks are also handy for a spot of good old-fashioned dakka and close-quarters violence, taking to the field armed to the teeth with kustom weaponry that they invented themselves.",
    movement: 6,
    army_id: orks_army_id,
    cost: 45,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 4,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Mozrog Skragbad",
    description: "Mozrog and his squigosaur steed Big Chompa are so tough that they can weather the worst any foe throws at them. In return, few enemies survive for long once Mozrog tears into them with his kustom cybork arm, Gutrippa. Those that do are doomed to be swallowed whole by Big Chompa’s yawning, fang-stuffed jaws.",
    movement: 10,
    army_id: orks_army_id,
    cost: 165,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 8,
    armour_save: 3,
    invuln_save: 4,
    wounds: 8,
    leadership: 6,
    obj_control: 3
})

Model.create({
    name: "Painboss",
    description: "The Painboss specialises in both the surgical care and cyber-augmentation of squigs, and of those suffering squig-related injuries. So as to provide their services ‘on the hoof’, Painbosses augment themselves with piston-driven soopa-legz, monowheels and the like – the better to deliver high-speed doktorin’.",
    movement: 6,
    army_id: orks_army_id,
    cost: 70,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 4,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Warboss",
    description: "A towering slab of muscle, fangs and bad attitude, the Warboss leads the charge from the very front. With klaw, fist and dakka the green behemoth bulldozes a bloody path through the enemy. Meanwhile, his window-rattling war cry and weapons-grade glower motivate his ladz to ever more gratuitous violence.",
    movement: 6,
    army_id: orks_army_id,
    cost: 70,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 5,
    wounds: 6,
    leadership: 6,
    obj_control: 1
})

Model.create({
    name: "Warboss In Mega Armour",
    description: "Any good Ork hunter knows the safest way to deal with a rampaging Warboss is to hit them with tank-busting artillery from as far away as possible. By donning a piston-driven suit of incredibly durable mega armour, the Warboss makes a mockery of such underhanded enemy tactics, much to the terror of his foes.",
    movement: 5,
    army_id: orks_army_id,
    cost: 90,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 6,
    armour_save: 2,
    invuln_save: 5,
    wounds: 7,
    leadership: 6,
    obj_control: 1
})

Model.create({
    name: "Weirdboy",
    description: "Weirdboyz channel the Waaagh! energy that builds up around battling Orks, unleashing it before it causes their heads to literally explode. This they do with gusto, whether vomiting blasts of devastating green ectoplasm at the enemy or teleporting Orks madly about the place.",
    movement: 6,
    army_id: orks_army_id,
    cost: 65,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 4,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Wurrboy",
    description: "Rarely lucid, Wurrboyz rant about visions of prey and lose themselves in the senses of their warband’s squigs. This doesn’t stop them unleashing their devastating powers, however, channelling the Waaagh! into overwhelming primal manifestations and beams of killing energy shot from their Eyez of Mork.",
    movement: 6,
    army_id: orks_army_id,
    cost: 60,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 4,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Zodgrod Wortsnagga",
    description: "With his Grabzappa crackling, Zodgrod herds his notorious super runts into battle. This irascible loon is never happier than when wrangling especially large and rowdy foes, usually by giving them a good dose of needles from his Squigstoppa Numba 5, then burying them in a rampaging horde of diminutive little monsters.",
    movement: 6,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 5,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Beast Snagga Boy",
    description: "Big, brutal, and belligerent, Beast Snagga Boyz are a force to be reckoned with. From the cannonball-like fist-shells of their thump guns, to the inescapable hooks of their choppas, Beast Snaggas excel in softening up their prey, dragging them down, then ripping them bodily to bits.",
    movement: 6,
    army_id: orks_army_id,
    cost: 95,
    min_squad: 9,
    max_squad: 10,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Beast Snagga Nob",
    description: "Big, brutal, and belligerent, Beast Snagga Boyz are a force to be reckoned with. From the cannonball-like fist-shells of their thump guns, to the inescapable hooks of their choppas, Beast Snaggas excel in softening up their prey, dragging them down, then ripping them bodily to bits.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Boy",
    description: "Ork Boyz surge into battle in huge, unruly mobs dotted with crude special weapons and led by foul-tempered Boss Nobz. Most simply stampede towards the enemy lines, relying on their numbers and natural hardiness to carry the charge home, while others hitch a ride on Trukks and Battlewagons so as to get stuck in all the faster.",
    movement: 6,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 9,
    max_squad: 10,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Boss Nob",
    description: "Ork Boyz surge into battle in huge, unruly mobs dotted with crude special weapons and led by foul-tempered Boss Nobz. Most simply stampede towards the enemy lines, relying on their numbers and natural hardiness to carry the charge home, while others hitch a ride on Trukks and Battlewagons so as to get stuck in all the faster.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Trukk",
    description: "Trukks are ramshackle assemblages of hastily welded and riveted scrap metal bolted to overpowered engine blocks and rusty chassis. Rolling on fat, armoured tyres, they bear mobs of Orks into battle at high speed, shrugging off enemy fire by the simple expedient of shedding ablative panels and plates.",
    movement: 12,
    army_id: orks_army_id,
    cost: 65,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 8,
    armour_save: 4,
    invuln_save: 6,
    wounds: 10,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Big’ed Bossbunka",
    description: "Having a Gargant’s severed head serve as a boss’ hut is not only a status symbol, but also provides a base of operations equipped with a remarkable array of Orky features – from the potent Gaze of Gork built into one eye to the kommanda’s shoutin’ pole that carries the boss’ bellowed commands far and wide.",
    movement: 0,
    army_id: orks_army_id,
    cost: 135,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 10,
    armour_save: 3,
    invuln_save: 6,
    wounds: 12,
    leadership: 7,
    obj_control: 0
})

Model.create({
    name: "Battlewagon",
    description: "No two Battlewagons are the same, for the Meks that build them can never resist cobbling on armour plates, ramming spikes, assorted dakka and random worky-gubbinz. However, all are rugged transport tanks with the capacity to bear a vast number of angry Orks into battle while shrugging off the worst the enemy can throw at them.",
    movement: 10,
    army_id: orks_army_id,
    cost: 160,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 10,
    armour_save: 3,
    invuln_save: 6,
    wounds: 16,
    leadership: 7,
    obj_control: 5
})

Model.create({
    name: "Blitza-bommer",
    description: "While not as shooty as a Dakkajet, each Blitza-bommer lugs enormous boom bombs into battle under its wings. Dive-bombing the enemy with reckless abandon, the Blitza-bommers detach their oversized payloads before (hopefully) pulling up and screaming skywards again while vast fireballs billow in their wake.",
    movement: 20,
    army_id: orks_army_id,
    cost: 115,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 9,
    armour_save: 3,
    invuln_save: 6,
    wounds: 12,
    leadership: 7,
    obj_control: 0
})

Model.create({
    name: "Boomdakka Snazzwagon",
    description: "The Boomdakka Snazzwagon is a high-speed riot on wheels. Bristling with dakka and swarming with anarchic greenskin crew, the vehicle roars through the enemy lines in a storm of roiling smoke, whistling bullets, incendiary burna bottles and shockingly foul language before skidding around for another pass.",
    movement: 12,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 7,
    armour_save: 4,
    invuln_save: 6,
    wounds: 9,
    leadership: 7,
    obj_control: 3
})

Model.create({
    name: "Burna Boyz - Boy",
    description: "The burna is a cutting torch intended for slicing up battlefield wreckage. Serendipitously, it also works well when searing through an enemy’s armour at close quarters, or, with a twist of its nozzle, can instead belch a tongue of roaring flame over the foe. Needless to say, the most pyromaniacally inclined Orks delight in doing both.",
    movement: 6,
    army_id: orks_army_id,
    cost: 60,
    min_squad: 4,
    max_squad: 8,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Burna Boyz - Spanner",
    description: "The burna is a cutting torch intended for slicing up battlefield wreckage. Serendipitously, it also works well when searing through an enemy’s armour at close quarters, or, with a twist of its nozzle, can instead belch a tongue of roaring flame over the foe. Needless to say, the most pyromaniacally inclined Orks delight in doing both.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 2,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Burna-bommer",
    description: "Meant for burning enemy infantry out of fortifications and dense cover, Burna-bommers fly so low that they frequently scorch their undercarriage with their own ordnance. The Burna Boy pilots consider this a small price to pay in order to watch their victims do ‘da burny dance’ as their skorcha missile racks and burna bombs rain down.",
    movement: 20,
    army_id: orks_army_id,
    cost: 125,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 9,
    armour_save: 3,
    invuln_save: 6,
    wounds: 12,
    leadership: 7,
    obj_control: 0
})

Model.create({
    name: "Dakkajet",
    description: "Rocketing through the skies on billowing trails of flame and smoke, Dakkajets come in low and hard over the battlefield. These single-seater Ork attack craft are ludicrously over-gunned for their size, all but shaking themselves apart as their pilots unleash storms of dakka on luckless ground targets or enemy aircraft with equal glee.",
    movement: 20,
    army_id: orks_army_id,
    cost: 135,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 9,
    armour_save: 3,
    invuln_save: 6,
    wounds: 12,
    leadership: 7,
    obj_control: 0
})

Model.create({
    name: "Deff Dread",
    description: "Being wired into a Deff Dread affords strength, resilience and a terrifying array of vicious weaponry. Of course, the reality of being stuck in a metal box for life and drinking your meals through a straw soon gets old, but the pilots’ resulting unhinged ferocity only serves to make Deff Dreads all the more dangerous in battle.",
    movement: 8,
    army_id: orks_army_id,
    cost: 120,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 9,
    armour_save: 2,
    invuln_save: 6,
    wounds: 8,
    leadership: 7,
    obj_control: 3
})

Model.create({
    name: "Deffkoptas",
    description: "Most Orks take a dim view of muckin’ about in the sky, and would much rather go to war with their feet firmly on the ground. Deffkopta pilots are the lunatic exception, hurtling ahead to spy out enemy forces for their warband to bring to battle, and to give those same enemies a good strafing run or three in the meantime.",
    movement: 12,
    army_id: orks_army_id,
    cost: 90,
    min_squad: 3,
    max_squad: 3,
    unit_limit: 2,
    toughness: 6,
    armour_save: 4,
    invuln_save: 6,
    wounds: 4,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Flash Gitz",
    description: "Flash Gitz are despised by other greenskins for being self-important show-offs with too much snazz and dakka for their own good. The Gitz couldn’t care less, of course, delighting in ostentatiously brandishing their over-the-top snazzguns before using them to utterly demolish the enemy in a hail of shells, blasts and rokkits.",
    movement: 6,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 5,
    max_squad: 5,
    unit_limit: 2,
    toughness: 6,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Gorkanaut",
    description: "Outcast Nobz pilot these lumbering war engines, following the echoing call of the Great Waaagh! out across the stars. They are welcomed by Ork warbands wherever they go, for the punishing hails of firepower they can unleash are devastating, and few foes can long survive the grasp of their enormous, piston-powered klaws.",
    movement: 8,
    army_id: orks_army_id,
    cost: 265,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 12,
    armour_save: 3,
    invuln_save: 6,
    wounds: 20,
    leadership: 7,
    obj_control: 8
})

Model.create({
    name: "Gretchin - Grot",
    description: "What Gretchin – also called grots – lack in stature, courage, resilience, discipline, motivation, loyalty, aggression and personal hygiene, they allegedly make up for in numbers. They are at least reasonable shots with their underpowered firearms, and if all else fails, the Orks find that grots make excellent bullet-stops.",
    movement: 6,
    army_id: orks_army_id,
    cost: 40,
    min_squad: 10,
    max_squad: 10,
    unit_limit: 2,
    toughness: 2,
    armour_save: 7,
    invuln_save: 0,
    wounds: 1,
    leadership: 8,
    obj_control: 2
})

Model.create({
    name: "Gretchin - Runtherd",
    description: "What Gretchin – also called grots – lack in stature, courage, resilience, discipline, motivation, loyalty, aggression and personal hygiene, they allegedly make up for in numbers. They are at least reasonable shots with their underpowered firearms, and if all else fails, the Orks find that grots make excellent bullet-stops.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Hunta Rig",
    description: "Welded, lashed and nailed together from enemy wrecks and scavenged scrap, the Hunta Rig forgoes a Wurrboy wurrtower (much to its crew’s relief). Instead it boasts an open metal deck and copious grab-handles, the better for chanting and bellowing mobs of Beast Snagga Boyz to ride along on the hunt.",
    movement: 10,
    army_id: orks_army_id,
    cost: 135,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 10,
    armour_save: 3,
    invuln_save: 0,
    wounds: 13,
    leadership: 7,
    obj_control: 5
})

Model.create({
    name: "Kill Rig",
    description: "The Kill Rig’s stikka kannon fires rokkit-harpoons big enough to wrangle battle tanks. Its ’eavy lobba hits with ground-quaking force, and the tramplasquig that tows this land barge can flatten a fortress gate. Yet it is the Wurrboy atop his wurrtower that both the enemy and the Beast Snaggas themselves fear the most.",
    movement: 10,
    army_id: orks_army_id,
    cost: 155,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 10,
    armour_save: 3,
    invuln_save: 0,
    wounds: 16,
    leadership: 7,
    obj_control: 5
})

Model.create({
    name: "Killa Kans",
    description: "Surgically wiring grots into combat walkers is risky: the runty loons tend to go on a bit of a power trip, hazardous to every Ork that ever treated them badly. On the other hand, their ability to shoot straight renders their hails of rokkits, bullets and grotzooka-launched scrap- shrapnel even more hazardous to the foe.",
    movement: 6,
    army_id: orks_army_id,
    cost: 125,
    min_squad: 3,
    max_squad: 3,
    unit_limit: 2,
    toughness: 6,
    armour_save: 3,
    invuln_save: 6,
    wounds: 5,
    leadership: 8,
    obj_control: 2
})

Model.create({
    name: "Kommandos - Kommando",
    description: "No right-thinking Ork trusts Kommandos. They sneak up on the enemy rather than charging in headlong, and have an unhealthy fascination with very big knives and their application to people’s backs, throats and guts. That said, having a band of Kommandos ambush the enemy mid-battle definitely has its uses.",
    movement: 6,
    army_id: orks_army_id,
    cost: 120,
    min_squad: 9,
    max_squad: 9,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Kommandos - Boss Nob",
    description: "No right-thinking Ork trusts Kommandos. They sneak up on the enemy rather than charging in headlong, and have an unhealthy fascination with very big knives and their application to people’s backs, throats and guts. That said, having a band of Kommandos ambush the enemy mid-battle definitely has its uses.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Lootas - Loota",
    description: "Lootas grub together every toof and fistful of scrap they can, then use the former to pay the Meks to turn the latter into very, very large guns. These they then turn on the enemy with gleeful abandon, unleashing such prodigious – if erratic – hails of fire that they can stop a battle tank in its tracks or scythe down squads of infantry.",
    movement: 6,
    army_id: orks_army_id,
    cost: 50,
    min_squad: 4,
    max_squad: 4,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Lootas - Spanner",
    description: "Lootas grub together every toof and fistful of scrap they can, then use the former to pay the Meks to turn the latter into very, very large guns. These they then turn on the enemy with gleeful abandon, unleashing such prodigious – if erratic – hails of fire that they can stop a battle tank in its tracks or scythe down squads of infantry.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Meganobz",
    description: "Mega armour comprises massive slabs of metal bashed roughly into shape, and is powered by pistons and sheer brute strength. It is highly resilient and can mount an array of potent weaponry. It is also usually worn to battle by toof-rich Nobz who would be scary enough even were they not each wearing their own Ork-portable bunker.",
    movement: 5,
    army_id: orks_army_id,
    cost: 105,
    min_squad: 2,
    max_squad: 3,
    unit_limit: 2,
    toughness: 6,
    armour_save: 2,
    invuln_save: 0,
    wounds: 3,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Megatrakk Scrapjet",
    description: "Just because an Ork aircraft has lost a wing or two, doesn’t mean some enterprising Speed Freek can’t find a tremendously violent use for it. Megatrakk Scrapjets tear across the battlefield shooting hails of rokkits before ploughing nose-drill-first through the enemy lines, drivers bellowing with glee the whole time.",
    movement: 12,
    army_id: orks_army_id,
    cost: 80,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 7,
    armour_save: 4,
    invuln_save: 6,
    wounds: 9,
    leadership: 7,
    obj_control: 3
})

Model.create({
    name: "Mek Gunz",
    description: "From guns that spew unstable force-bubbles to overcharged energy cannons, gravity beamers that crumple their targets like a squig-oil canister in a Nob’s fist to tractor-beams that toss foes about and drag planes from the air, the only unifying factor about the madcap Mek Gunz is what a mess they make of the foe.",
    movement: 3,
    army_id: orks_army_id,
    cost: 150,
    min_squad: 1,
    max_squad: 3,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 6,
    wounds: 6,
    leadership: 8,
    obj_control: 2
})

Model.create({
    name: "Morkanaut",
    description: "Usually piloted by the exiled Badmek who built it, a Morkanaut is a hulking combat walker with a dash of Mork-esque know-wotz applied. Packed with all manner of glowy gubbinz, Morkanauts unleash their arsenals of bizarre and deadly weapons in what their pilots think of as displays of pure kunnin’ worthy of Mork.",
    movement: 8,
    army_id: orks_army_id,
    cost: 280,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 12,
    armour_save: 3,
    invuln_save: 5,
    wounds: 20,
    leadership: 7,
    obj_control: 8
})

Model.create({
    name: "Nobz",
    description: "Nobz swagger into battle wielding a jaw-dropping assortment of kombi-weapons, favourite sluggas, very large choppas, piston-driven klaws and any other instrument of gratuitous violence they can get their claws on. Coupled with their exceptional resilience and sheer belligerence, this renders them terrifying combatants indeed.",
    movement: 6,
    army_id: orks_army_id,
    cost: 105,
    min_squad: 4,
    max_squad: 5,
    unit_limit: 2,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Rukkatrukk Squigbuggy",
    description: "These vehicles started out as mobile food wagons, but became weapons of war the moment Orks realised how hilarious it was to pelt the enemy (or their mates) with squigs that latched on like living man-traps, squigs that vomited corrosive or toxic juices, and squigs with a propensity for detonating like an artillery shell.",
    movement: 12,
    army_id: orks_army_id,
    cost: 100,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 7,
    armour_save: 4,
    invuln_save: 6,
    wounds: 9,
    leadership: 7,
    obj_control: 3
})

Model.create({
    name: "Shokkjump Dragsta",
    description: "Combining shokk attack technology, great speed and a cheerful disregard for life and limb, the Shokkjump Dragsta provides the Orks with a vehicle that can teleport itself through – occasionally into – feet-thick fortress walls while its kustom shokk rifle bores warp tunnels right through its luckless victims.",
    movement: 12,
    army_id: orks_army_id,
    cost: 75,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 7,
    armour_save: 4,
    invuln_save: 6,
    wounds: 9,
    leadership: 7,
    obj_control: 3
})

Model.create({
    name: "Squighog Boyz - Squighog Boy",
    description: "With their mounts snorting and saddlegitz hanging on for dear life, Squighog Boyz thunder into the fight. They fling rokkit-propelled stikkas, hitting with enough force to pierce plate armour, then employ muscle, weight, momentum and sheer belligerence to squash those foes still standing to a paste.",
    movement: 10,
    army_id: orks_army_id,
    cost: 160,
    min_squad: 3,
    max_squad: 3,
    unit_limit: 2,
    toughness: 7,
    armour_save: 4,
    invuln_save: 0,
    wounds: 3,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Squighog Boyz - Nob on Smasha Squig",
    description: "With their mounts snorting and saddlegitz hanging on for dear life, Squighog Boyz thunder into the fight. They fling rokkit-propelled stikkas, hitting with enough force to pierce plate armour, then employ muscle, weight, momentum and sheer belligerence to squash those foes still standing to a paste.",
    movement: 10,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 2,
    toughness: 7,
    armour_save: 4,
    invuln_save: 0,
    wounds: 4,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Stompa",
    description: "Something akin to a bad-tempered, armour-plated mountain covered in guns, the Stompa is a walking idol to Gork and Mork. It packs enough firepower to level an enemy fortress or annihilate entire formations of troops with a single volley, while anything unlucky enough to get within reach is soon crushed flat.",
    movement: 10,
    army_id: orks_army_id,
    cost: 800,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 14,
    armour_save: 2,
    invuln_save: 6,
    wounds: 30,
    leadership: 6,
    obj_control: 12
})

Model.create({
    name: "Stormboy - Stormboy",
    description: "Most Orks mock Stormboyz for their acts of juvenile rebellion, from taking orders and shining their boots to marching about, talking about ‘taktics’ and even following a battle plan. Yet when that plan is ‘strap on a high powered rokkit and hurtle into the enemy bellowing “Waaagh!”’, it does prove to have its merits.",
    movement: 12,
    army_id: orks_army_id,
    cost: 65,
    min_squad: 4,
    max_squad: 5,
    unit_limit: 2,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 1,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Stormboy - Boss Nob",
    description: "Most Orks mock Stormboyz for their acts of juvenile rebellion, from taking orders and shining their boots to marching about, talking about ‘taktics’ and even following a battle plan. Yet when that plan is ‘strap on a high powered rokkit and hurtle into the enemy bellowing “Waaagh!”’, it does prove to have its merits.",
    movement: 12,
    army_id: orks_army_id,
    cost: 65,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 5,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Warbikers - Warbiker",
    description: "Ork Warbikers race into battle with dakkaguns hammering, ragged trails of dust and smoke boiling up behind them like an ill omen. They race one another at breakneck pace to reach the enemy first, execute death-defying stunts at suicidal speeds, then crash headlong into the foe’s battle line like battering rams.",
    movement: 12,
    army_id: orks_army_id,
    cost: 70,
    min_squad: 2,
    max_squad: 3,
    unit_limit: 2,
    toughness: 6,
    armour_save: 4,
    invuln_save: 6,
    wounds: 3,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Warbikers - Boss Nob on Warbike",
    description: "Ork Warbikers race into battle with dakkaguns hammering, ragged trails of dust and smoke boiling up behind them like an ill omen. They race one another at breakneck pace to reach the enemy first, execute death-defying stunts at suicidal speeds, then crash headlong into the foe’s battle line like battering rams.",
    movement: 12,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 6,
    armour_save: 4,
    invuln_save: 6,
    wounds: 4,
    leadership: 7,
    obj_control: 2
})

Model.create({
    name: "Wazbom Blastajet",
    description: "Some Meks take to the skies in their own kustom aircraft. The result is the Wazbom Blastajet, an airborne workshop that is wreathed in a protective force field, and bristling with weird weapons that pluck their targets from the ground, blast them to atoms or rip them apart with conflicting tellyporta beams.",
    movement: 20,
    army_id: orks_army_id,
    cost: 175,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 9,
    armour_save: 3,
    invuln_save: 6,
    wounds: 12,
    leadership: 7,
    obj_control: 0
})

Model.create({
    name: "Breaka Boyz - Boy",
    description: "Breaka Boyz dismantle the foe’s war engines and defences with well-placed krumpings from their smash hammers. Some use a pair of brutal knucklebustas, while the more addled opt for a tankhammer: a rokkit strapped to a big metal stick that offers a satisfyingly explosive means of up-close annihilation.",
    movement: 6,
    army_id: orks_army_id,
    cost: 140,
    min_squad: 5,
    max_squad: 5,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Breaka Boyz - Boss Nob",
    description: "Breaka Boyz dismantle the foe’s war engines and defences with well-placed krumpings from their smash hammers. Some use a pair of brutal knucklebustas, while the more addled opt for a tankhammer: a rokkit strapped to a big metal stick that offers a satisfyingly explosive means of up-close annihilation.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Tankbustas - Tankbusta",
    description: "Tankbustas fixate on blasting enemy vehicles into scrap using barrages of rokkits that detonate in deafening explosions. They wield varied, cobbled-together launchas, and are laden with an arsenal of explosive projectiles, whose dubious reliability is made up for by the Tankbustas’ enthusiasm.",
    movement: 6,
    army_id: orks_army_id,
    cost: 135,
    min_squad: 5,
    max_squad: 5,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Tankbustas - Boss Nob",
    description: "Tankbustas fixate on blasting enemy vehicles into scrap using barrages of rokkits that detonate in deafening explosions. They wield varied, cobbled-together launchas, and are laden with an arsenal of explosive projectiles, whose dubious reliability is made up for by the Tankbustas’ enthusiasm.",
    movement: 6,
    army_id: orks_army_id,
    cost: 0,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 5,
    armour_save: 4,
    invuln_save: 0,
    wounds: 2,
    leadership: 7,
    obj_control: 1
})

Model.create({
    name: "Gargantuan Squiggoth",
    description: "Squiggoths can grow in size indefinitely. The larger they get, the more prized they become in the eyes of Ork Warbosses, whose simple minds see them for the colossal living weapons they are. Kitted out with armour, guns and bellowing passengers, truly giant specimens are walking bastions, their momentum all but unstoppable.",
    movement: 10,
    army_id: orks_army_id,
    cost: 440,
    min_squad: 1,
    max_squad: 1,
    unit_limit: 1,
    toughness: 13,
    armour_save: 3,
    invuln_save: 0,
    wounds: 30,
    leadership: 7,
    obj_control: 1
})
