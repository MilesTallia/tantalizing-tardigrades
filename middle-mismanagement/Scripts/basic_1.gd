extends Node

var rng = RandomNumberGenerator.new()

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
	var proj = randomize_project(false)
	var aqi = rng.randf_range(1.0, 6.0)
	var cost = rng.randf_range(0.0, 30.0)
	var output = rng.randf_range(30, 100)
	set_values(proj, aqi, cost, output)
	return [aqi,cost,output]
	
func randomize_good():
	var version = rng.randf_range(0, 10)
	if (version >= 8):
		return randomize_aqi_reducer()
	else:
		var proj = randomize_project(true)
		var aqi = 0
		var cost = rng.randf_range(-15.0, 5.0)
		var output = rng.randf_range(40, 80)
		set_values(proj, aqi, cost, output)
		return [aqi,cost,output]

func randomize_aqi_reducer():
	var proj = randomize_project(true)
	var aqi = rng.randf_range(-8, -4)
	var cost = rng.randf_range(-20.0, -10.0)
	var output = 0
	set_values(proj, aqi, cost, output)
	return [aqi,cost,output]
	
	

func set_values(project, aqi, cost, output):
	aqi = snapped(aqi, 0.01)
	cost = snapped(cost, 0.01)
	output = snapped(output, 0.01)
	$Title.set_child_text(project)
	var plus = ""
	if aqi >= 0:
		plus = "+"
	$AQI.set_child_text(plus + str(aqi) + " AQI")
	if (aqi <= 0):
		$AQI.set_value(Color("forest_green"))
	else:
		$AQI.set_value(Color("red"))
	plus = ""
	if cost >= 0:
		plus = "+"
	$Budget.set_child_text(plus + str(cost) + "K")
	if (cost >= 0):
		$Budget.set_value(Color("forest_green"))
	else:
		$Budget.set_value(Color("red"))
	$Output.set_child_text(str(output) + " MW")
	$Output.set_value(Color(0,0,0))	









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
