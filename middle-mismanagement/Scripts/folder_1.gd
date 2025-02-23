extends "res://Scripts/Folder.gd"
	
func assign_company(good : bool):
	if (good == true):
		company = eco_freindly_companies.pick_random()
	else:
		company = ominous_companies.pick_random()
	
func spawn_pages(good : bool):
	
	var page = load("res://Scenes/Pages/Presets/Basic1.tscn")
	var pageInst = page.instantiate()
	add_child(pageInst)
		
	if (good):
		pageInst.rand(true)
	else:
		pageInst.rand(false)

func set_values(aqi, cost, output):
	aqi = snapped(aqi, 0.01)
	$AQI.set_child_text(str(aqi))
	







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
	"TerraAnnihilation Industries",
	"FuelReaper Dynamics",
	"CarbonDoom Power",
	"StratumObliterator Holdings",
	"MagmaDevourer Solutions",
	"Sedimentary Catastrophe Group",
	"DeepTerra Ruination"
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
