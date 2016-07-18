SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pokemon_go`
--

-- --------------------------------------------------------

--
-- Table structure for table `encounters`
--

CREATE TABLE IF NOT EXISTS `encounters` (
  `sighting_id` int(11) NOT NULL AUTO_INCREMENT,
  `pokemon_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `location` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sighting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `encounter_notification`
--

CREATE TABLE IF NOT EXISTS `encounter_notification` (
  `pokemon_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  PRIMARY KEY (`pokemon_id`,`room_id`),
  UNIQUE KEY `pokemon_id` (`pokemon_id`,`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pokedex`
--

CREATE TABLE IF NOT EXISTS `pokedex` (
  `pokemon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `common` tinyint(1) NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `type1` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type2` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pokemon_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pokedex`
--

INSERT INTO `pokedex` (`pokemon_id`, `name`, `common`, `image`, `type1`, `type2`, `description`) VALUES
(1, 'Bulbasaur', 0, 'http://cdn.bulbagarden.net/upload/e/ec/001MS.png', 'grass', 'poison', 'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun''s rays, the seed grows progressively larger.'),
(2, 'Ivysaur', 0, 'http://cdn.bulbagarden.net/upload/6/6b/002MS.png', 'grass', 'poison', 'There is a bud on this Pokémon''s back. To support its weight, Ivysaur''s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it''s a sign that the bud will bloom into a large flower soon.'),
(3, 'Venusaur', 0, 'http://cdn.bulbagarden.net/upload/d/df/003MS.png', 'grass', 'poison', 'There is a large flower on Venusaur''s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower''s aroma soothes the emotions of people.'),
(4, 'Charmander', 0, 'http://cdn.bulbagarden.net/upload/b/bb/004MS.png', 'fire', '', 'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.'),
(5, 'Charmeleon', 0, 'http://cdn.bulbagarden.net/upload/d/dc/005MS.png', 'fire', '', 'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.'),
(6, 'Charizard', 0, 'http://cdn.bulbagarden.net/upload/0/01/006MS.png', 'fire', 'flying', 'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.'),
(7, 'Squirtle', 0, 'http://cdn.bulbagarden.net/upload/9/92/007MS.png', 'water', '', 'Squirtle''s shell is not merely used for protection. The shell''s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.'),
(8, 'Wartortle', 0, 'http://cdn.bulbagarden.net/upload/f/f3/008MS.png', 'water', '', 'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon''s toughness as a battler.'),
(9, 'Blastoise', 0, 'http://cdn.bulbagarden.net/upload/c/cb/009MS.png', 'water', '', 'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.'),
(10, 'Caterpie', 1, 'http://cdn.bulbagarden.net/upload/6/69/010MS.png', 'bug', '', 'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.'),
(11, 'Metapod', 0, 'http://cdn.bulbagarden.net/upload/c/ce/011MS.png', 'bug', '', 'The shell covering this Pokémon''s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.'),
(12, 'Butterfree', 0, 'http://cdn.bulbagarden.net/upload/1/14/012MS.png', 'bug', 'flying', 'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.'),
(13, 'Weedle', 1, 'http://cdn.bulbagarden.net/upload/6/65/013MS.png', 'bug', 'poison', 'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).'),
(14, 'Kakuna', 0, 'http://cdn.bulbagarden.net/upload/8/81/014MS.png', 'bug', 'poison', 'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.'),
(15, 'Beedrill', 0, 'http://cdn.bulbagarden.net/upload/5/5a/015MS.png', 'bug', 'poison', 'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.'),
(16, 'Pidgey', 1, 'http://cdn.bulbagarden.net/upload/9/9c/016MS.png', 'normal', 'flying', 'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.'),
(17, 'Pidgeotto', 0, 'http://cdn.bulbagarden.net/upload/a/a9/017MS.png', 'normal', 'flying', 'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.'),
(18, 'Pidgeot', 0, 'http://cdn.bulbagarden.net/upload/6/68/018MS.png', 'normal', 'flying', 'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.'),
(19, 'Rattata', 0, 'http://cdn.bulbagarden.net/upload/4/4d/019MS.png', 'normal', '', 'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.'),
(20, 'Raticate', 0, 'http://cdn.bulbagarden.net/upload/4/4d/020MS.png', 'normal', '', 'Raticate''s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.'),
(21, 'Spearow', 1, 'http://cdn.bulbagarden.net/upload/5/5b/021MS.png', 'normal', 'flying', 'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.'),
(22, 'Fearow', 0, 'http://cdn.bulbagarden.net/upload/3/35/022MS.png', 'normal', 'flying', 'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.'),
(23, 'Ekans', 0, 'http://cdn.bulbagarden.net/upload/0/0d/023MS.png', 'poison', '', 'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.'),
(24, 'Arbok', 0, 'http://cdn.bulbagarden.net/upload/d/d3/024MS.png', 'poison', '', 'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.'),
(25, 'Pikachu', 0, 'http://cdn.bulbagarden.net/upload/0/0f/025MS.png', 'electric', '', 'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it''s evidence that this Pokémon mistook the intensity of its charge.'),
(26, 'Raichu', 0, 'http://cdn.bulbagarden.net/upload/d/da/026MS.png', 'electric', '', 'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon''s nest.'),
(27, 'Sandshrew', 0, 'http://cdn.bulbagarden.net/upload/c/c3/027MS.png', 'ground', '', 'Sandshrew''s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.'),
(28, 'Sandslash', 0, 'http://cdn.bulbagarden.net/upload/e/e0/028MS.png', 'ground', '', 'Sandslash''s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.'),
(29, 'NidoranM', 0, 'http://cdn.bulbagarden.net/upload/a/ab/029MS.png', 'poison', '', 'Nidoran has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.'),
(30, 'Nidorina', 0, 'http://cdn.bulbagarden.net/upload/d/d0/030MS.png', 'poison', '', 'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.'),
(31, 'Nidoqueen', 0, 'http://cdn.bulbagarden.net/upload/3/31/031MS.png', 'poison', 'ground', 'Nidoqueen''s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.'),
(32, 'NidoranF', 0, 'http://cdn.bulbagarden.net/upload/f/fb/032MS.png', 'poison', '', 'Nidoran has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon''s notice.'),
(33, 'Nidorino', 0, 'http://cdn.bulbagarden.net/upload/0/0e/033MS.png', 'poison', '', 'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.'),
(34, 'Nidoking', 0, 'http://cdn.bulbagarden.net/upload/1/18/034MS.png', 'poison', 'ground', 'Nidoking''s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.'),
(35, 'Clefairy', 0, 'http://cdn.bulbagarden.net/upload/f/f9/035MS.png', 'fairy', '', 'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.'),
(36, 'Clefable', 0, 'http://cdn.bulbagarden.net/upload/7/75/036MS.png', 'fairy', '', 'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.'),
(37, 'Vulpix', 0, 'http://cdn.bulbagarden.net/upload/8/85/037MS.png', 'fire', '', 'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.'),
(38, 'Ninetales', 0, 'http://cdn.bulbagarden.net/upload/1/10/038MS.png', 'fire', '', 'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe''s mind. This Pokémon is said to live for a thousand years.'),
(39, 'Jigglypuff', 0, 'http://cdn.bulbagarden.net/upload/9/9c/039MS.png', 'normal', 'fairy', 'Jigglypuff''s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.'),
(40, 'Wigglytuff', 0, 'http://cdn.bulbagarden.net/upload/f/f1/040MS.png', 'normal', 'fairy', 'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon''s eyes, it is quickly washed away.'),
(41, 'Zubat', 1, 'http://cdn.bulbagarden.net/upload/9/96/041MS.png', 'poison', 'flying', 'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.'),
(42, 'Golbat', 0, 'http://cdn.bulbagarden.net/upload/d/d0/042MS.png', 'poison', 'flying', 'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.'),
(43, 'Oddish', 0, 'http://cdn.bulbagarden.net/upload/a/a5/043MS.png', 'grass', 'poison', 'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.'),
(44, 'Gloom', 0, 'http://cdn.bulbagarden.net/upload/d/d9/044MS.png', 'grass', 'poison', 'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.'),
(45, 'Vileplume', 0, 'http://cdn.bulbagarden.net/upload/3/3e/045MS.png', 'grass', 'poison', 'Vileplume''s toxic pollen triggers atrocious allergy attacks. That''s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.'),
(46, 'Paras', 1, 'http://cdn.bulbagarden.net/upload/7/7a/046MS.png', 'bug', 'grass', 'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.'),
(47, 'Parasect', 0, 'http://cdn.bulbagarden.net/upload/4/41/047MS.png', 'bug', 'grass', 'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.'),
(48, 'Venonat', 0, 'http://cdn.bulbagarden.net/upload/1/1e/048MS.png', 'bug', 'poison', 'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even minuscule prey.'),
(49, 'Venomoth', 0, 'http://cdn.bulbagarden.net/upload/3/31/049MS.png', 'bug', 'poison', 'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.'),
(50, 'Diglett', 0, 'http://cdn.bulbagarden.net/upload/8/8b/050MS.png', 'ground', '', 'Diglett are raised in most farms. The reason is simple— wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.'),
(51, 'Dugtrio', 0, 'http://cdn.bulbagarden.net/upload/8/86/051MS.png', 'ground', '', 'Dugtrio are actually triplets that emerged from one body. As a result, each triplet thinks exactly like the other two triplets. They work cooperatively to burrow endlessly.'),
(52, 'Meowth', 0, 'http://cdn.bulbagarden.net/upload/5/50/052MS.png', 'normal', '', 'Meowth withdraws its sharp claws into its paws to slinkily sneak about without making any incriminating footsteps. For some reason, this Pokémon loves shiny coins that glitter with light.'),
(53, 'Persian', 0, 'http://cdn.bulbagarden.net/upload/a/a7/053MS.png', 'normal', '', 'Persian has six bold whiskers that give it a look of toughness. The whiskers sense air movements to determine what is in the Pokémon''s surrounding vicinity. It becomes docile if grabbed by the whiskers.'),
(54, 'Psyduck', 0, 'http://cdn.bulbagarden.net/upload/6/6b/054MS.png', 'water', '', 'Psyduck uses a mysterious power. When it does so, this Pokémon generates brain waves that are supposedly only seen in sleepers. This discovery spurred controversy among scholars.'),
(55, 'Golduck', 0, 'http://cdn.bulbagarden.net/upload/6/64/055MS.png', 'water', '', 'The webbed flippers on its forelegs and hind legs and the streamlined body of Golduck give it frightening speed. This Pokémon is definitely much faster than even the most athletic swimmer.'),
(56, 'Mankey', 0, 'http://cdn.bulbagarden.net/upload/a/ad/056MS.png', 'fighting', '', 'When Mankey starts shaking and its nasal breathing turns rough, it''s a sure sign that it is becoming angry. However, because it goes into a towering rage almost instantly, it is impossible for anyone to flee its wrath.'),
(57, 'Primeape', 0, 'http://cdn.bulbagarden.net/upload/f/f1/057MS.png', 'fighting', '', 'When Primeape becomes furious, its blood circulation is boosted. In turn, its muscles are made even stronger. However, it also becomes much less intelligent at the same time.'),
(58, 'Growlithe', 0, 'http://cdn.bulbagarden.net/upload/6/69/058MS.png', 'fire', '', 'Growlithe has a superb sense of smell. Once it smells anything, this Pokémon won''t forget the scent, no matter what. It uses its advanced olfactory sense to determine the emotions of other living things.'),
(59, 'Arcanine', 0, 'http://cdn.bulbagarden.net/upload/3/35/059MS.png', 'fire', '', 'Arcanine is known for its high speed. It is said to be capable of running over 6,200 miles in a single day and night. The fire that blazes wildly within this Pokémon''s body is its source of power.'),
(60, 'Poliwag', 0, 'http://cdn.bulbagarden.net/upload/1/17/060MS.png', 'water', '', 'Poliwag has a very thin skin. It is possible to see the Pokémon''s spiral innards right through the skin. Despite its thinness, however, the skin is also very flexible. Even sharp fangs bounce right off it.'),
(61, 'Poliwhirl', 0, 'http://cdn.bulbagarden.net/upload/3/36/061MS.png', 'water', '', 'The surface of Poliwhirl''s body is always wet and slick with a slimy fluid. Because of this slippery covering, it can easily slip and slide out of the clutches of any enemy in battle.'),
(62, 'Poliwrath', 0, 'http://cdn.bulbagarden.net/upload/5/5e/062MS.png', 'water', 'fighting', 'Poliwrath''s highly developed, brawny muscles never grow fatigued, however much it exercises. It is so tirelessly strong, this Pokémon can swim back and forth across the ocean without effort.'),
(63, 'Abra', 0, 'http://cdn.bulbagarden.net/upload/c/cf/063MS.png', 'psychic', '', 'Abra sleeps for eighteen hours a day. However, it can sense the presence of foes even while it is sleeping. In such a situation, this Pokémon immediately teleports to safety.'),
(64, 'Kadabra', 0, 'http://cdn.bulbagarden.net/upload/b/b6/064MS.png', 'psychic', '', 'Kadabra emits a peculiar alpha wave if it develops a headache. Only those people with a particularly strong psyche can hope to become a Trainer of this Pokémon.'),
(65, 'Alakazam', 0, 'http://cdn.bulbagarden.net/upload/c/ca/065MS.png', 'psychic', '', 'Alakazam''s brain continually grows, making its head far too heavy to support with its neck. This Pokémon holds its head up using its psychokinetic power instead.'),
(66, 'Machop', 0, 'http://cdn.bulbagarden.net/upload/6/6c/066MS.png', 'fighting', '', 'Machop''s muscles are special—they never get sore no matter how much they are used in exercise. This Pokémon has sufficient power to hurl a hundred adult humans.'),
(67, 'Machoke', 0, 'http://cdn.bulbagarden.net/upload/0/0f/067MS.png', 'fighting', '', 'Machoke''s thoroughly toned muscles possess the hardness of steel. This Pokémon has so much strength, it can easily hold aloft a sumo wrestler on just one finger.'),
(68, 'Machamp', 0, 'http://cdn.bulbagarden.net/upload/1/1e/068MS.png', 'fighting', '', 'Machamp has the power to hurl anything aside. However, trying to do any work requiring care and dexterity causes its arms to get tangled. This Pokémon tends to leap into action before it thinks.'),
(69, 'Bellsprout', 0, 'http://cdn.bulbagarden.net/upload/7/7b/069MS.png', 'grass', 'poison', 'Bellsprout''s thin and flexible body lets it bend and sway to avoid any attack, however strong it may be. From its mouth, this Pokémon spits a corrosive fluid that melts even iron.'),
(70, 'Weepinbell', 0, 'http://cdn.bulbagarden.net/upload/d/d5/070MS.png', 'grass', 'poison', 'Weepinbell has a large hook on its rear end. At night, the Pokémon hooks on to a tree branch and goes to sleep. If it moves around in its sleep, it may wake up to find itself on the ground.'),
(71, 'Victreebel', 0, 'http://cdn.bulbagarden.net/upload/9/9b/071MS.png', 'grass', 'poison', 'Victreebel has a long vine that extends from its head. This vine is waved and flicked about as if it were an animal to attract prey. When an unsuspecting prey draws near, this Pokémon swallows it whole.'),
(72, 'Tentacool', 0, 'http://cdn.bulbagarden.net/upload/4/42/072MS.png', 'water', 'poison', 'Tentacool''s body is largely composed of water. If it is removed from the sea, it dries up like parchment. If this Pokémon happens to become dehydrated, put it back into the sea.'),
(73, 'Tentacruel', 0, 'http://cdn.bulbagarden.net/upload/f/fc/073MS.png', 'water', 'poison', 'Tentacruel has large red orbs on its head. The orbs glow before lashing the vicinity with a harsh ultrasonic blast. This Pokémon''s outburst creates rough waves around it.'),
(74, 'Geodude', 0, 'http://cdn.bulbagarden.net/upload/0/04/074MS.png', 'rock', 'ground', 'The longer a Geodude lives, the more its edges are chipped and worn away, making it more rounded in appearance. However, this Pokémon''s heart will remain hard, craggy, and rough always.'),
(75, 'Graveler', 0, 'http://cdn.bulbagarden.net/upload/5/5c/075MS.png', 'rock', 'ground', 'Graveler grows by feeding on rocks. Apparently, it prefers to eat rocks that are covered in moss. This Pokémon eats its way through a ton of rocks on a daily basis.'),
(76, 'Golem', 0, 'http://cdn.bulbagarden.net/upload/3/34/076MS.png', 'rock', 'ground', 'Golem live up on mountains. If there is a large earthquake, these Pokémon will come rolling down off the mountains en masse to the foothills below.'),
(77, 'Ponyta', 0, 'http://cdn.bulbagarden.net/upload/5/55/077MS.png', 'fire', '', 'Ponyta is very weak at birth. It can barely stand up. This Pokémon becomes stronger by stumbling and falling to keep up with its parent.'),
(78, 'Rapidash', 0, 'http://cdn.bulbagarden.net/upload/6/66/078MS.png', 'fire', '', 'Rapidash usually can be seen casually cantering in the fields and plains. However, when this Pokémon turns serious, its fiery manes flare and blaze as it gallops its way up to 150 mph.'),
(79, 'Slowpoke', 0, 'http://cdn.bulbagarden.net/upload/6/6a/079MS.png', 'water', 'psychic', 'Slowpoke uses its tail to catch prey by dipping it in water at the side of a river. However, this Pokémon often forgets what it''s doing and often spends entire days just loafing at water''s edge.'),
(80, 'Slowbro', 0, 'http://cdn.bulbagarden.net/upload/b/b6/080MS.png', 'water', 'psychic', 'Slowbro''s tail has a Shellder firmly attached with a bite. As a result, the tail can''t be used for fishing anymore. This causes Slowbro to grudgingly swim and catch prey instead.'),
(81, 'Magnemite', 0, 'http://cdn.bulbagarden.net/upload/0/0f/081MS.png', 'electric', 'steel', 'Magnemite attaches itself to power lines to feed on electricity. If your house has a power outage, check your circuit breakers. You may find a large number of this Pokémon clinging to the breaker box.'),
(82, 'Magneton', 0, 'http://cdn.bulbagarden.net/upload/0/0c/082MS.png', 'electric', 'steel', 'Magneton emits a powerful magnetic force that is fatal to mechanical devices. As a result, large cities sound sirens to warn citizens of large-scale outbreaks of this Pokémon.'),
(83, 'Farfetch''d', 0, 'http://cdn.bulbagarden.net/upload/5/57/083MS.png', 'normal', 'flying', 'Farfetch''d is always seen with a stalk from a plant of some sort. Apparently, there are good stalks and bad stalks. This Pokémon has been known to fight with others over stalks.'),
(84, 'Doduo', 0, 'http://cdn.bulbagarden.net/upload/f/fc/084MS.png', 'normal', 'flying', 'Doduo''s two heads never sleep at the same time. Its two heads take turns sleeping, so one head can always keep watch for enemies while the other one sleeps.'),
(85, 'Dodrio', 0, 'http://cdn.bulbagarden.net/upload/1/19/085MS.png', 'normal', 'flying', 'Watch out if Dodrio''s three heads are looking in three separate directions. It''s a sure sign that it is on its guard. Don''t go near this Pokémon if it''s being wary—it may decide to peck you.'),
(86, 'Seel', 0, 'http://cdn.bulbagarden.net/upload/9/9b/086MS.png', 'water', '', 'Seel hunts for prey in the frigid sea underneath sheets of ice. When it needs to breathe, it punches a hole through the ice with the sharply protruding section of its head.'),
(87, 'Dewgong', 0, 'http://cdn.bulbagarden.net/upload/2/20/087MS.png', 'water', 'ice', 'Dewgong loves to snooze on bitterly cold ice. The sight of this Pokémon sleeping on a glacier was mistakenly thought to be a mermaid by a mariner long ago.'),
(88, 'Grimer', 0, 'http://cdn.bulbagarden.net/upload/5/50/088MS.png', 'poison', '', 'Grimer''s sludgy and rubbery body can be forced through any opening, however small it may be. This Pokémon enters sewer pipes to drink filthy wastewater.'),
(89, 'Muk', 0, 'http://cdn.bulbagarden.net/upload/b/b4/089MS.png', 'poison', '', 'From Muk''s body seeps a foul fluid that gives off a nose-bendingly horrible stench. Just one drop of this Pokémon''s body fluid can turn a pool stagnant and rancid.'),
(90, 'Shellder', 1, 'http://cdn.bulbagarden.net/upload/4/41/090MS.png', 'water', '', 'At night, this Pokémon uses its broad tongue to burrow a hole in the seafloor sand and then sleep in it. While it is sleeping, Shellder closes its shell, but leaves its tongue hanging out.'),
(91, 'Cloyster', 0, 'http://cdn.bulbagarden.net/upload/b/bc/091MS.png', 'water', 'ice', 'Cloyster is capable of swimming in the sea. It does so by swallowing water, then jetting it out toward the rear. This Pokémon shoots spikes from its shell using the same system.'),
(92, 'Gastly', 0, 'http://cdn.bulbagarden.net/upload/c/cf/092MS.png', 'ghost', 'poison', 'Gastly is largely composed of gaseous matter. When exposed to a strong wind, the gaseous body quickly dwindles away. Groups of this Pokémon cluster under the eaves of houses to escape the ravages of wind.'),
(93, 'Haunter', 0, 'http://cdn.bulbagarden.net/upload/7/71/093MS.png', 'ghost', 'poison', 'Haunter is a dangerous Pokémon. If one beckons you while floating in darkness, you must never approach it. This Pokémon will try to lick you with its tongue and steal your life away.'),
(94, 'Gengar', 0, 'http://cdn.bulbagarden.net/upload/a/a4/094MS.png', 'ghost', 'poison', 'Sometimes, on a dark night, your shadow thrown by a streetlight will suddenly and startlingly overtake you. It is actually a Gengar running past you, pretending to be your shadow.'),
(95, 'Onix', 0, 'http://cdn.bulbagarden.net/upload/c/cd/095MS.png', 'rock', 'ground', 'Onix has a magnet in its brain. It acts as a compass so that this Pokémon does not lose direction while it is tunneling. As it grows older, its body becomes increasingly rounder and smoother.'),
(96, 'Drowzee', 1, 'http://cdn.bulbagarden.net/upload/8/8e/096MS.png', 'psychic', '', 'If your nose becomes itchy while you are sleeping, it''s a sure sign that one of these Pokémon is standing above your pillow and trying to eat your dream through your nostrils.'),
(97, 'Hypno', 0, 'http://cdn.bulbagarden.net/upload/9/98/097MS.png', 'psychic', '', 'Hypno holds a pendulum in its hand. The arcing movement and glitter of the pendulum lull the foe into a deep state of hypnosis. While this Pokémon searches for prey, it polishes the pendulum.'),
(98, 'Krabby', 0, 'http://cdn.bulbagarden.net/upload/4/40/098MS.png', 'water', '', 'Krabby live on beaches, burrowed inside holes dug into the sand. On sandy beaches with little in the way of food, these Pokémon can be seen squabbling with each other over territory.'),
(99, 'Kingler', 0, 'http://cdn.bulbagarden.net/upload/5/5c/099MS.png', 'water', '', 'Kingler has an enormous, oversized claw. It waves this huge claw in the air to communicate with others. However, because the claw is so heavy, the Pokémon quickly tires.'),
(100, 'Voltorb', 0, 'http://cdn.bulbagarden.net/upload/c/c1/100MS.png', 'electric', '', 'Voltorb was first sighted at a company that manufactures Poké Balls. The link between that sighting and the fact that this Pokémon looks very similar to a Poké Ball remains a mystery.'),
(101, 'Electrode', 0, 'http://cdn.bulbagarden.net/upload/6/69/101MS.png', 'electric', '', 'Electrode eats electricity in the atmosphere. On days when lightning strikes, you can see this Pokémon exploding all over the place from eating too much electricity.'),
(102, 'Exeggcute', 0, 'http://cdn.bulbagarden.net/upload/a/a6/102MS.png', 'grass', 'psychic', 'This Pokémon consists of six eggs that form a closely knit cluster. The six eggs attract each other and spin around. When cracks increasingly appear on the eggs, Exeggcute is close to evolution.'),
(103, 'Exeggutor', 0, 'http://cdn.bulbagarden.net/upload/d/db/103MS.png', 'grass', 'psychic', 'Exeggutor originally came from the tropics. Its heads steadily grow larger from exposure to strong sunlight. It is said that when the heads fall off, they group together to form Exeggcute.'),
(104, 'Cubone', 0, 'http://cdn.bulbagarden.net/upload/2/2e/104MS.png', 'ground', '', 'Cubone pines for the mother it will never see again. Seeing a likeness of its mother in the full moon, it cries. The stains on the skull the Pokémon wears are made by the tears it sheds.'),
(105, 'Marowak', 0, 'http://cdn.bulbagarden.net/upload/6/6f/105MS.png', 'ground', '', 'Marowak is the evolved form of a Cubone that has overcome its sadness at the loss of its mother and grown tough. This Pokémon''s tempered and hardened spirit is not easily broken.'),
(106, 'Hitmonlee', 0, 'http://cdn.bulbagarden.net/upload/6/60/106MS.png', 'fighting', '', 'Hitmonlee''s legs freely contract and stretch. Using these springlike legs, it bowls over foes with devastating kicks. After battle, it rubs down its legs and loosens the muscles to overcome fatigue.'),
(107, 'Hitmonchan', 0, 'http://cdn.bulbagarden.net/upload/1/1a/107MS.png', 'fighting', '', 'Hitmonchan is said to possess the spirit of a boxer who had been working toward a world championship. This Pokémon has an indomitable spirit and will never give up in the face of adversity.'),
(108, 'Lickitung', 0, 'http://cdn.bulbagarden.net/upload/2/25/108MS.png', 'normal', '', 'Whenever Lickitung comes across something new, it will unfailingly give it a lick. It does so because it memorizes things by texture and by taste. It is somewhat put off by sour things.'),
(109, 'Koffing', 0, 'http://cdn.bulbagarden.net/upload/3/3f/109MS.png', 'poison', '', 'If Koffing becomes agitated, it raises the toxicity of its internal gases and jets them out from all over its body. This Pokémon may also overinflate its round body, then explode.'),
(110, 'Weezing', 0, 'http://cdn.bulbagarden.net/upload/2/22/110MS.png', 'poison', '', 'Weezing loves the gases given off by rotted kitchen garbage. This Pokémon will find a dirty, unkempt house and make it its home. At night, when the people in the house are asleep, it will go through the trash.'),
(111, 'Rhyhorn', 0, 'http://cdn.bulbagarden.net/upload/6/67/111MS.png', 'ground', 'rock', 'Rhyhorn runs in a straight line, smashing everything in its path. It is not bothered even if it rushes headlong into a block of steel. This Pokémon may feel some pain from the collision the next day, however.'),
(112, 'Rhydon', 0, 'http://cdn.bulbagarden.net/upload/c/ce/112MS.png', 'ground', 'rock', 'Rhydon''s horn can crush even uncut diamonds. One sweeping blow of its tail can topple a building. This Pokémon''s hide is extremely tough. Even direct cannon hits don''t leave a scratch.'),
(113, 'Chansey', 0, 'http://cdn.bulbagarden.net/upload/e/ea/113MS.png', 'normal', '', 'Chansey lays nutritionally excellent eggs on an everyday basis. The eggs are so delicious, they are easily and eagerly devoured by even those people who have lost their appetite.'),
(114, 'Tangela', 0, 'http://cdn.bulbagarden.net/upload/4/45/114MS.png', 'grass', '', 'Tangela''s vines snap off easily if they are grabbed. This happens without pain, allowing it to make a quick getaway. The lost vines are replaced by newly grown vines the very next day.'),
(115, 'Kangaskhan', 0, 'http://cdn.bulbagarden.net/upload/6/68/115MS.png', 'normal', '', 'If you come across a young Kangaskhan playing by itself, you must never disturb it or attempt to catch it. The baby Pokémon''s parent is sure to be in the area, and it will become violently enraged at you.'),
(116, 'Horsea', 0, 'http://cdn.bulbagarden.net/upload/2/23/116MS.png', 'water', '', 'Horsea eats small insects and moss off of rocks. If the ocean current turns fast, this Pokémon anchors itself by wrapping its tail around rocks or coral to prevent being washed away.'),
(117, 'Seadra', 0, 'http://cdn.bulbagarden.net/upload/8/81/117MS.png', 'water', '', 'Seadra sleeps after wriggling itself between the branches of coral. Those trying to harvest coral are occasionally stung by this Pokémon''s poison barbs if they fail to notice it.'),
(118, 'Goldeen', 0, 'http://cdn.bulbagarden.net/upload/9/9b/118MS.png', 'water', '', 'Goldeen is a very beautiful Pokémon with fins that billow elegantly in water. However, don''t let your guard down around this Pokémon—it could ram you powerfully with its horn.'),
(119, 'Seaking', 0, 'http://cdn.bulbagarden.net/upload/8/88/119MS.png', 'water', '', 'In the autumn, Seaking males can be seen performing courtship dances in riverbeds to woo females. During this season, this Pokémon''s body coloration is at its most beautiful.'),
(120, 'Staryu', 0, 'http://cdn.bulbagarden.net/upload/6/60/120MS.png', 'water', '', 'Staryu''s center section has an organ called the core that shines bright red. If you go to a beach toward the end of summer, the glowing cores of these Pokémon look like the stars in the sky.'),
(121, 'Starmie', 0, 'http://cdn.bulbagarden.net/upload/5/55/121MS.png', 'water', 'psychic', 'Starmie''s center section—the core—glows brightly in seven colors. Because of its luminous nature, this Pokémon has been given the nickname “the gem of the sea."'),
(122, 'Mr. Mime', 0, 'http://cdn.bulbagarden.net/upload/5/58/122MS.png', 'psychic', 'fairy', 'Mr. Mime is a master of pantomime. Its gestures and motions convince watchers that something unseeable actually exists. Once the watchers are convinced, the unseeable thing exists as if it were real.'),
(123, 'Scyther', 0, 'http://cdn.bulbagarden.net/upload/5/54/123MS.png', 'bug', 'flying', 'Scyther is blindingly fast. Its blazing speed enhances the effectiveness of the twin scythes on its forearms. This Pokémon''s scythes are so effective, they can slice through thick logs in one wicked stroke.'),
(124, 'Jynx', 0, 'http://cdn.bulbagarden.net/upload/f/f5/124MS.png', 'ice', 'psychic', 'Jynx walks rhythmically, swaying and shaking its hips as if it were dancing. Its motions are so bouncingly alluring, people seeing it are compelled to shake their hips without giving any thought to what they are doing.'),
(125, 'Electabuzz', 0, 'http://cdn.bulbagarden.net/upload/7/72/125MS.png', 'electric', '', 'When a storm arrives, gangs of this Pokémon compete with each other to scale heights that are likely to be stricken by lightning bolts. Some towns use Electabuzz in place of lightning rods.'),
(126, 'Magmar', 0, 'http://cdn.bulbagarden.net/upload/e/e7/126MS.png', 'fire', '', 'In battle, Magmar blows out intensely hot flames from all over its body to intimidate its opponent. This Pokémon''s fiery bursts create heat waves that ignite grass and trees in its surroundings.'),
(127, 'Pinsir', 0, 'http://cdn.bulbagarden.net/upload/5/5c/127MS.png', 'bug', '', 'Pinsir is astoundingly strong. It can grip a foe weighing twice its weight in its horns and easily lift it. This Pokémon''s movements turn sluggish in cold places.'),
(128, 'Tauros', 0, 'http://cdn.bulbagarden.net/upload/9/95/128MS.png', 'normal', '', 'This Pokémon is not satisfied unless it is rampaging at all times. If there is no opponent for Tauros to battle, it will charge at thick trees and knock them down to calm itself.'),
(129, 'Magikarp', 0, 'http://cdn.bulbagarden.net/upload/7/7c/129MS.png', 'water', '', 'Magikarp is a pathetic excuse for a Pokémon that is only capable of flopping and splashing. This behavior prompted scientists to undertake research into it.'),
(130, 'Gyarados', 0, 'http://cdn.bulbagarden.net/upload/a/a0/130MS.png', 'water', 'flying', 'When Magikarp evolves into Gyarados, its brain cells undergo a structural transformation. It is said that this transformation is to blame for this Pokémon''s wildly violent nature.'),
(131, 'Lapras', 0, 'http://cdn.bulbagarden.net/upload/4/4b/131MS.png', 'water', 'ice', 'People have driven Lapras almost to the point of extinction. In the evenings, this Pokémon is said to sing plaintively as it seeks what few others of its kind still remain.'),
(132, 'Ditto', 0, 'http://cdn.bulbagarden.net/upload/5/53/132MS.png', 'normal', '', 'Ditto rearranges its cell structure to transform itself into other shapes. However, if it tries to transform itself into something by relying on its memory, this Pokémon manages to get details wrong.'),
(133, 'Eevee', 1, 'http://cdn.bulbagarden.net/upload/d/de/133MS.png', 'normal', '', 'Eevee has an unstable genetic makeup that suddenly mutates due to the environment in which it lives. Radiation from various stones causes this Pokémon to evolve.'),
(134, 'Vaporeon', 0, 'http://cdn.bulbagarden.net/upload/b/be/134MS.png', 'water', '', 'Vaporeon underwent a spontaneous mutation and grew fins and gills that allow it to live underwater. This Pokémon has the ability to freely control water.'),
(135, 'Jolteon', 0, 'http://cdn.bulbagarden.net/upload/1/16/135MS.png', 'electric', '', 'Jolteon''s cells generate a low level of electricity. This power is amplified by the static electricity of its fur, enabling the Pokémon to drop thunderbolts. The bristling fur is made of electrically charged needles.'),
(136, 'Flareon', 0, 'http://cdn.bulbagarden.net/upload/3/30/136MS.png', 'fire', '', 'Flareon''s fluffy fur has a functional purpose—it releases heat into the air so that its body does not get excessively hot. This Pokémon''s body temperature can rise to a maximum of 1,650 degrees Fahrenheit.'),
(137, 'Porygon', 0, 'http://cdn.bulbagarden.net/upload/f/f7/137MS.png', 'normal', '', 'Porygon is capable of reverting itself entirely back to program data and entering cyberspace. This Pokémon is copy protected so it cannot be duplicated by copying.'),
(138, 'Omanyte', 0, 'http://cdn.bulbagarden.net/upload/9/97/138MS.png', 'rock', 'water', 'Omanyte is one of the ancient and long-since-extinct Pokémon that have been regenerated from fossils by people. If attacked by an enemy, it withdraws itself inside its hard shell.'),
(139, 'Omastar', 0, 'http://cdn.bulbagarden.net/upload/2/2a/139MS.png', 'rock', 'water', 'Omastar uses its tentacles to capture its prey. It is believed to have become extinct because its shell grew too large and heavy, causing its movements to become too slow and ponderous.'),
(140, 'Kabuto', 0, 'http://cdn.bulbagarden.net/upload/1/1e/140MS.png', 'rock', 'water', 'Kabuto is a Pokémon that has been regenerated from a fossil. However, in extremely rare cases, living examples have been discovered. The Pokémon has not changed at all for 300 million years.'),
(141, 'Kabutops', 0, 'http://cdn.bulbagarden.net/upload/0/08/141MS.png', 'rock', 'water', 'Kabutops swam underwater to hunt for its prey in ancient times. The Pokémon was apparently evolving from being a water dweller to living on land as evident from the beginnings of change in its gills and legs.'),
(142, 'Aerodactyl', 0, 'http://cdn.bulbagarden.net/upload/d/d1/142MS.png', 'rock', 'flying', 'Aerodactyl is a Pokémon from the age of dinosaurs. It was regenerated from genetic material extracted from amber. It is imagined to have been the king of the skies in ancient times.'),
(143, 'Snorlax', 0, 'http://cdn.bulbagarden.net/upload/d/d6/143MS.png', 'normal', '', 'Snorlax''s typical day consists of nothing more than eating and sleeping. It is such a docile Pokémon that there are children who use its expansive belly as a place to play.'),
(144, 'Articuno', 0, 'http://cdn.bulbagarden.net/upload/0/04/144MS.png', 'ice', 'flying', 'Articuno is a legendary bird Pokémon that can control ice. The flapping of its wings chills the air. As a result, it is said that when this Pokémon flies, snow will fall.'),
(145, 'Zapdos', 0, 'http://cdn.bulbagarden.net/upload/3/3f/145MS.png', 'electric', 'flying', 'Zapdos is a legendary bird Pokémon that has the ability to control electricity. It usually lives in thunderclouds. The Pokémon gains power if it is stricken by lightning bolts.'),
(146, 'Moltres', 0, 'http://cdn.bulbagarden.net/upload/f/fe/146MS.png', 'fire', 'flying', 'Moltres is a legendary bird Pokémon that has the ability to control fire. If this Pokémon is injured, it is said to dip its body in the molten magma of a volcano to burn and heal itself.'),
(147, 'Dratini', 0, 'http://cdn.bulbagarden.net/upload/2/26/147MS.png', 'dragon', '', 'Dratini continually molts and sloughs off its old skin. It does so because the life energy within its body steadily builds to reach uncontrollable levels.'),
(148, 'Dragonair', 0, 'http://cdn.bulbagarden.net/upload/4/4e/148MS.png', 'dragon', '', 'Dragonair stores an enormous amount of energy inside its body. It is said to alter weather conditions in its vicinity by discharging energy from the crystals on its neck and tail.'),
(149, 'Dragonite', 0, 'http://cdn.bulbagarden.net/upload/c/cc/149MS.png', 'dragon', 'flying', 'Dragonite is capable of circling the globe in just 16 hours. It is a kindhearted Pokémon that leads lost and foundering ships in a storm to the safety of land.'),
(150, 'Mewtwo', 0, 'http://cdn.bulbagarden.net/upload/1/1a/150MS.png', 'psychic', '', 'Mewtwo is a Pokémon that was created by genetic manipulation. However, even though the scientific power of humans created this Pokémon''s body, they failed to endow Mewtwo with a compassionate heart.'),
(151, 'Mew', 0, 'http://cdn.bulbagarden.net/upload/a/a7/151MS.png', 'psychic', '', 'Mew is said to possess the genetic composition of all Pokémon. It is capable of making itself invisible at will, so it entirely avoids notice even if it approaches people.');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE IF NOT EXISTS `trainers` (
  `user_id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `mention` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `team` enum('valor','mystic','instinct','none') NOT NULL,
  `home` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
