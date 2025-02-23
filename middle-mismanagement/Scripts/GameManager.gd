extends Node


var day_num = 0
var money = 10000
var current_atm = 30
var change_atm = 0
var current_energy = 500
var num_folders : int = 3
var array_folders = []
var diff: int = 0
var num_stamped: int  = 0

func get_day_num() -> int:
	return day_num
	
func set_day_num(value :int) -> void:
	day_num = value
	
func get_money() -> int:
	return money
	
func set_money(value :int) -> void:
	money = value
	
func get_current_atm() -> int:
	return current_atm
	
func set_current_atm(value :int) -> void:
	current_atm = value
	
func get_change_atm() -> int:
	return change_atm
	
func set_change_atm(value :int) -> void:
	change_atm = value
	
func get_current_energy() -> int:
	return current_energy
	
func set_current_energy(value :int) -> void:
	current_energy = value 
	
func get_num_folders() -> int:
	return num_folders
	
func set_num_folders(value :int) -> void:
	num_folders = value
	
func get_array_folders():
	return array_folders
	

	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_day()
	
	
func start_day() -> void:
	var clock = get_node("..//Clock").get_child(3)
	if 300 - day_num * 15 < 30:
		clock.start(30)
	else:
		clock.start(300 - day_num * 15)
	for child in get_tree().get_nodes_in_group("page"):
		child.queue_free()
	array_folders.resize(num_folders)
	num_stamped = 0
	set_day_num(day_num + 1)
	if day_num < 4:
		diff = 1
	elif day_num < 7:
		diff = 2
	else:
		diff = 3
	var debrief_page = get_node("..//DebriefPage")
	debrief_page.set_text()
	var i : int = 0
	var FOLDER = load("res://Scenes/Folder.tscn")

	while i < num_folders:
		var folder = FOLDER.instantiate()
		await get_tree().create_timer(0).timeout
		folder.difficulty = diff
		var dir = true
		if randi() % 2:
			dir = false 
		folder.good = dir
		if dir and diff == 1:
			folder.company = eco_freindly_companies.pick_random()
		elif dir and diff == 2:
			folder.company = normal_renewable_companies.pick_random()
		elif !dir and diff == 1:
			folder.company = ominous_companies.pick_random()
		elif !dir and diff == 2:
			folder.company = shady_companies.pick_random()
		elif diff == 3:
			folder.company = vague_companies.pick_random()
		get_parent().add_child(folder)
		folder.position += Vector2(0, 90* i + 100)
		array_folders[i] = folder
		print(folder.company)
		i += 1	

	#new_folder.position = position  

	
func end_day() -> void:
	var screen = get_node("..//ColorRect")
	screen.show()
	await get_tree().create_timer(3).timeout
	screen.hide()
	for folder in array_folders:
		get_parent().remove_child(folder)
		if folder.passed:
			var folder_stats = folder.get_stats()
			print(folder_stats)
			set_money(money + folder_stats[1]*1000)
			print(money + folder_stats[1])
			set_change_atm(change_atm + folder_stats[0])
			set_current_energy(current_energy + folder_stats[2])
	
	if (money < 0):
		end_game()
	elif (current_atm > 200):
		end_game()
	elif (current_energy < day_num * 100):
		end_game()
	else:
		current_atm += change_atm
		start_day()

func end_game():
	print(get_path())
	get_tree().change_scene_to_file("res://Scenes/Death.tscn")
	#change scene to end game
	return; 
	
func folder_stamped() -> void:
	num_stamped += 1
	if num_stamped == num_folders:
		await get_tree().create_timer(1).timeout
		end_day()
		
var ominous_companies = [
	"Inferno Extraction Syndicate",
	"Abyssal Fuel Holdings",
	"Desolation Coalworks",
	"The Obsidian Dominion",
	"Vile Stratum Resources",
	"Grim Ember Industries",
	"Blackheart Petroleum",
	"Ruinous Energy Conglomerate",
	"The Scourge Fuel Initiative",
	"Malignant Core Extraction",
	"Plaguefire Energy Systems",
	"Voidstone Mining Corp.",
	"The Ash Baron Group",
	"Decay Fuel Partners",
	"Cindermaw Resources",
	"The Iron Fist Refinery",
	"Entropy Energy Solutions",
	"The Serpent's Coil Petroleum",
	"Doombringer Coal Ltd.",
	"The Wraith Fuel Dynasty",
	"Blighted Basin Energy",
	"Wasteland Petroleum Group",
	"The Shadow Shelf Resources",
	"Frostbite Energy Ventures",
	"Toxic Delta Fuels",
	"Hellfire Coal & Gas",
	"The Serpent's Ridge Energy",
	"Frozen Tundra Oil Sands",
	"Scorched Earth Energy",
	"The Chasm Rock Energy",
	"Nightmare Fuel Group",
	"Oblivion Resources LLC",
	"The Dying Star Energy Trust",
	"Cataclysm Petroleum",
	"Eternal Ember Core",
	"The Darkstone Power",
	"Ashen Cinder Industries",
	"Venom Fuel Holdings",
	"The Tyrant's Onyx Energy",
	"Black Death Energy",
	"PetroTyrant Global",
	"DeathCore Technologies",
	"Geocide Systems",
	"Terra Annihilation Industries",
	"FuelReaper Dynamics",
	"CarbonDoom Power",
	"Stratum Obliterator Holdings",
	"Magma Devourer Solutions",
	"Sedimentary Catastrophe Group",
	"DeepTerra Ruination"
]

var shady_companies = [
	"Apex Petroleum Group",
	"Continental Energy Reserves",
	"Global Stratum Resources",
	"Magma Core Industries",
	"Sedimentary Power Holdings",
	"TerraFirma Fuels",
	"Lithosphere Energy Inc.",
	"Deep Earth Extraction",
	"Carboniferous Holdings",
	"Primeval Energy Corp.",
	"Vanguard Refining Solutions",
	"Zenith Energy Systems",
	"Pinnacle Fuel Technologies",
	"Nexus Power Generation",
	"Quantum Combustion Ltd.",
	"Dominion Fuelworks",
	"Catalyst Energy Partners",
	"Meridian Oil & Gas",
	"Titan Coal Corporation",
	"Frontier Energy Dynamics",
	"Appalachian Basin Energy",
	"Great Plains Petroleum",
	"Coastal Shelf Resources",
	"Boreal Energy Ventures",
	"Delta Stream Fuels",
	"Highland Coal & Gas",
	"Mesa Ridge Energy",
	"Tundra Oil Sands",
	"Prairie Fire Energy.",
	"Canyon Rock Energy.",
	"Astra Fuel Group",
	"Nova Resources LLC",
	"Solstice Energy Trust",
	"Equinox Petroleum",
	"Ember Core Energy",
	"Obsidian Power",
	"Cinder Rock Industries",
	"Amber Fuel Holdings",
	"Onyx Energy Partners",
	"Blackstone Energy.",
	"PetroStratum Global",
	"CoalCore Technologies",
	"GeoRefine Systems",
	"Terra Combustion Industries",
	"FuelLith Dynamics",
	"CarbonNexus Power",
	"StratumFuel Holdings",
	"MagmaPower Solutions",
	"Sedimentary Combustion Group.",
	"DeepTerra Resources."
]

var eco_freindly_companies = [
	"Solaris Energy Solutions",
	"Windward Power Systems",
	"HydroSphere Renewables",
	"GeoThermal Dynamics",
	"BioFuel Innovations",
	"Evergreen Energy Collective",
	"Sustainable Synergy Group",
	"Clean Current Technologies",
	"EcoCore Ventures",
	"Veridian Renewable Resources",
	"Aurora Wind Farms",
	"Ocean Tide Power",
	"TerraCycle Energy",
	"GreenGrid Initiatives",
	"Renewable Nexus Partners",
	"Lumina Solar Technologies",
	"AquaFlow Energy",
	"EarthBloom Power",
	"BioReserve Energy",
	"Harmony Hydroelectric",
	"SunStream Renewables",
	"Zephyr Wind Energy",
	"DeepWell Geothermal",
	"FloraFuel Systems",
	"Ecocentric Energy Group",
	"Vitality Renewables",
	"ClearSky Power",
	"Nature's Current",
	"Living Earth Energy",
	"Radiant Solar Collective",
	"BreezeTech Wind Power",
	"Tidal Harmony Energy",
	"Regenerative Energy Labs",
	"GreenSpark Innovations",
	"EcoSphere Power Systems",
	"PureLight Solar",
	"RiverRun Renewables",
	"EarthCore Geothermal",
	"PlantPower Fuels",
	"SustainaGrid Solutions",
	"Bright Horizon Energy",
	"WaveForm Power",
	"TerraVitality Renewables",
	"BioGenesis Energy",
	"EcoFlow Technologies",
	"SunRise Energy Partners",
	"WindSong Renewables",
	"GeoSource Dynamics",
	"GreenLeaf Fuels"    ,
	"Symbiotic Energy Systems"
]

var normal_renewable_companies = [
	"Energy Integration Group",
	"Resource Optimization Solutions",
	"Power Systems Development",
	"Sustainable Technologies Inc.",
	"Advanced Energy Ventures",
	"Renewable Resource Management",
	"Environmental Energy Holdings",
	"Clean Technology Partners",
	"Eco-Systems Innovations",
	"Veridian Sustainable Assets",
	"Aurora Power Initiatives",
	"Oceanic Resource Development",
	"TerraCycle Solutions",
	"GreenTech Ventures",
	"Energy Infrastructure Group",
	"Solar Technology Solutions",
	"Hydro Resource Management",
	"Earth Systems Integration",
	"Bio-Energy Resources",
	"Hydropower Ventures",
	"Sunstream Technologies",
	"Wind Resource Solutions",
	"Geothermal Energy Assets",
	"Biomass Resource Management",
	"Eco-Power Ventures",
	"Vitality Technology Group",
	"ClearSky Infrastructure",
	"Natural Resource Systems",
	"Earth Energy Innovations",
	"Radiant Power Solutions",
	"BreezeTech Assets",
	"Tidal Resource Development",
	"Regenerative Technology Group",
	"GreenSpark Ventures",
	"EcoSphere Infrastructure",
	"PureLight Technologies",
	"RiverRun Resource Management",
	"EarthCore Assets",
	"PlantFuel Resource Systems",
	"SustainaGrid Ventures",
	"Bright Horizon Infrastructure",
	"WaveForm Solutions",
	"TerraVitality Technologies",
	"BioGenesis Assets",
	"EcoFlow Resource Management",
	"Sunrise Technology Group",
	"Windsong Ventures",
	"GeoSource Infrastructure",
	"Synergistic Energy Solutions",
	"Core Resource Innovations"
]

var vague_companies = [
	"Apex Global Energy Solutions",
	"Core Dynamic Power Systems",
	"Unified Energy Spectrum",
	"Vector Resource Group",
	"Nexus Applied Energy",
	"Prime Integrated Power",
	"Global Spectrum Energy",
	"Dominion Energy Matrix",
	"Catalyst Advanced Power",
	"Strategic Energy Framework",
	"Pinnacle Resource Dynamics",
	"Meridian Energy Technologies",
	"Frontier Power Integration",
	"Zenith Applied Resources",
	"Vanguard Energy Spectrum",
	"Alpha Resource Dynamics",
	"Beta Integrated Power",
	"Gamma Spectrum Energy",
	"Delta Energy Matrix",
	"Epsilon Advanced Power",
	"Sigma Resource Framework",
	"Theta Resource Dynamics",
	"Lambda Integrated Power",
	"Omega Spectrum Energy",
	"Kappa Energy Matrix",
	"Psi Advanced Power",
	"Rho Resource Framework",
	"Tau Resource Dynamics",
	"Upsilon Integrated Power",
	"Chi Spectrum Energy",
	"Phi Energy Matrix",
	"Shell Corp Energies",
	"Energy Solutions Group LLC",
	"Power Systems International",
	"Resource Dynamics Corporation",
	"Advanced Energy Holdings",
	"Integrated Power Ventures",
	"Global Energy Technologies",
	"Strategic Resource Systems",
	"Dynamic Power Solutions",
	"Applied Energy Concepts",
	"Spectrum Resource Management",
	"Energy Matrix Partners",
	"Resource Framework Dynamics",
	"Integrated Systems Energy",
	"Power Spectrum Holdings",
	"Resource Dynamics International",
	"Energy Solutions Corporation",
	"Power Systems Ventures",
	"Resource Holdings Group",
]
