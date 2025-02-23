extends Node

var rng = RandomNumberGenerator.new()

var proj
var aqi
var cost
var output

func rand(good : bool):
	if (good == true):
		return randomize_good()
	else:
		return randomize_bad()
		
func randomize_project(good : bool):
	if (good == true):
		return eco_friendly_projects.pick_random()
	else:
		return ominous_projects.pick_random()
	
func randomize_bad():
	proj = randomize_project(false)
	aqi = rng.randf_range(1.0, 6.0)
	cost = rng.randf_range(0.0, 30.0)
	output = rng.randf_range(30, 100)
	set_values()
	return [aqi,cost,output]
	
func randomize_good():
	var version = rng.randf_range(0, 10)
	if (version >= 8):
		return randomize_aqi_reducer()
	else:
		proj = randomize_project(true)
		aqi = 0
		cost = rng.randf_range(-15.0, 5.0)
		output = rng.randf_range(40, 80)
		set_values()
		return [aqi,cost,output]

func randomize_aqi_reducer():
	proj = randomize_project(true)
	aqi = rng.randf_range(-8, -4)
	cost = rng.randf_range(-20.0, -10.0)
	output = 0
	set_values()
	return [aqi,cost,output]

func set_values():
	aqi = snapped(aqi, 0.01)
	cost = snapped(cost, 0.01)
	output = snapped(output, 0.01)
	
	
	
	$Title.set_child_text(proj)
	$Graph.Xmin = "0"
	$Graph.Ymin = "0"
	$Graph.Xmax = "1"
	$Graph.Ymax = str(aqi)
	$Graph.Xunit = "Time"
	$Graph.Yunit = "AQI"
	if aqi > 0:
		$Graph.direction = "up"
	else:
		$Graph.direction = "down"
	$Graph.loadValues()
	
	var dupePage = load("res://Scenes/Pages/Presets/Basic3Dummy.tscn")
	var dupePageInst = dupePage.instantiate()
	get_parent().add_sibling(dupePageInst)
	dupePageInst.position = get_parent().position + Vector2(50,50)
	
	dupePageInst.get_child(3).get_child(1).set_child_text(proj)
	dupePageInst.get_child(3).get_child(2).Xmin = "0"
	dupePageInst.get_child(3).get_child(2).Ymin = "0"
	dupePageInst.get_child(3).get_child(2).Xmax = "1"
	dupePageInst.get_child(3).get_child(2).Ymax = str(cost)
	dupePageInst.get_child(3).get_child(2).Xunit = "Time"
	dupePageInst.get_child(3).get_child(2).Yunit = "Budget"
	if cost > 0:
		dupePageInst.get_child(3).get_child(2).direction = "up"
	else:
		dupePageInst.get_child(3).get_child(2).direction = "down"
	dupePageInst.get_child(3).get_child(2).loadValues()
	
	var dupePage2 = load("res://Scenes/Pages/Presets/Basic3Dummy.tscn")
	var dupePageInst2 = dupePage2.instantiate()
	get_parent().add_sibling(dupePageInst2)
	dupePageInst2.position = get_parent().position + Vector2(100,100)
	
	dupePageInst2.get_child(3).get_child(1).set_child_text(proj)
	dupePageInst2.get_child(3).get_child(2).Xmin = "0"
	dupePageInst2.get_child(3).get_child(2).Ymin = "0"
	dupePageInst2.get_child(3).get_child(2).Xmax = "1"
	dupePageInst2.get_child(3).get_child(2).Ymax = str(output)
	dupePageInst2.get_child(3).get_child(2).Xunit = "Time"
	dupePageInst2.get_child(3).get_child(2).Yunit = "Output"
	if output > 0:
		dupePageInst2.get_child(3).get_child(2).direction = "up"
	else:
		dupePageInst2.get_child(3).get_child(2).direction = "down"
	dupePageInst2.get_child(3).get_child(2).loadValues()









var ominous_projects = [
	"Strategic Defoliation\nInitiative",
	"Deep Bore Nuclear\nWaste Storage",
	"Experimental Seismic\nTesting (Fracking)",
	"Remote Arctic Resource\nExploitation",
	"Unregulated Deep-Sea\nMining",
	"Forced Relocation for\nDam Construction",
	"Large-Scale Incineration\nProject",
	"Controversial Pesticide\nDeployment",
	"Offshore Oil Platform\nExpansion",
	"Unmonitored Chemical\nWaste Discharge",
	"Tax Haven Resource\nTransfer",
	"Lobby-Driven Regulatory\nExemption",
	"Subsidized Fossil Fuel\nInfrastructure",
	"Offshore Data Storage\n(for tax evasion)",
	"Non-Disclosure Agreement\nLand Acquisition",
	"Strategic Price Fixing\nInitiative",
	"Environmental Impact\nReport Suppression",
	"Delayed Infrastructure\nMaintenance",
	"Political Campaign\nFunding (lobbying)",
	"Contract Bid Rigging"
]

var eco_friendly_projects = [
	"Community Solar\nMicrogrid Implementation",
	"Urban Green Roof\nExpansion",
	"Coastal Wetland\nRestoration Project",
	"Reforestation and\nNative Species Planting",
	"Public Transportation\nElectrification",
	"Sustainable Agriculture\nand Food Distribution",
	"Wildlife Corridor\nDevelopment",
	"Water Conservation and\nPurification Initiative",
	"Renewable Energy\nStorage Deployment",
	"Habitat Restoration and\nInvasive Species Removal",
	"Solar Farm Construction",
	"Wind Turbine Installation",
	"Hydroelectric Dam Upgrade",
	"Geothermal Energy Plant\nDevelopment",
	"Biomass Energy Facility\nConstruction",
	"Renewable Energy Grid\nInterconnection",
	"Energy Efficiency\nImprovement Program",
	"Sustainable Building\nConstruction",
	"Electric Vehicle\nCharging Infrastructure",
	"Smart Grid Technology \nDeployment"
]
