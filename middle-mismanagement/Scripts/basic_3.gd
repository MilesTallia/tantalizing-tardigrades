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
	if (randf() > 0.5):
		$Graph.Xmin = "0"
		$Graph.Ymin = "0"
		$Graph.Xmax = str(snapped(randf() * 7, 0.01))
		$Graph.Ymax = str(aqi)
		$Graph.Xunit = "Time"
		$Graph.Yunit = "AQI"
		if aqi > 0:
			$Graph.direction = "up"
		else:
			$Graph.direction = "down"
	else:
		# flipped
		$Graph.Xmin = "0"
		$Graph.Ymin = str(snapped(randf() * 7, 0.01))
		$Graph.Xmax = str(aqi)
		$Graph.Ymax = "0"
		$Graph.Xunit = "AQI"
		$Graph.Yunit = "Time"
		if aqi > 0:
			$Graph.direction = "down"
		else:
			$Graph.direction = "up"
	$Graph.loadValues()
	
	var dupePage = load("res://Scenes/Pages/Presets/Basic3Dummy.tscn")
	var dupePageInst = dupePage.instantiate()
	get_parent().add_sibling(dupePageInst)
	dupePageInst.position = get_parent().position + Vector2(50,50)
	
	dupePageInst.get_child(3).get_child(1).set_child_text(proj)
	if (randf() > 0.5):
		dupePageInst.get_child(3).get_child(2).Xmin = "0"
		dupePageInst.get_child(3).get_child(2).Ymin = "0"
		dupePageInst.get_child(3).get_child(2).Xmax = str(snapped(randf() * 7, 0.01))
		dupePageInst.get_child(3).get_child(2).Ymax = str(cost)
		dupePageInst.get_child(3).get_child(2).Xunit = "Time"
		dupePageInst.get_child(3).get_child(2).Yunit = "Budget (K)"
		if cost > 0:
			dupePageInst.get_child(3).get_child(2).direction = "up"
		else:
			dupePageInst.get_child(3).get_child(2).direction = "down"
	else:
		# flipped
		dupePageInst.get_child(3).get_child(2).Xmin = "0"
		dupePageInst.get_child(3).get_child(2).Ymin = str(snapped(randf() * 7, 0.01))
		dupePageInst.get_child(3).get_child(2).Xmax = str(cost)
		dupePageInst.get_child(3).get_child(2).Ymax = "0"
		dupePageInst.get_child(3).get_child(2).Xunit = "Budget (K)"
		dupePageInst.get_child(3).get_child(2).Yunit = "Time"
		if cost > 0:
			dupePageInst.get_child(3).get_child(2).direction = "down"
		else:
			dupePageInst.get_child(3).get_child(2).direction = "up"
	dupePageInst.get_child(3).get_child(2).loadValues()
	
	var dupePage2 = load("res://Scenes/Pages/Presets/Basic3Dummy.tscn")
	var dupePageInst2 = dupePage2.instantiate()
	get_parent().add_sibling(dupePageInst2)
	dupePageInst2.position = get_parent().position + Vector2(100,100)
	
	dupePageInst2.get_child(3).get_child(1).set_child_text(proj)
	if (randf() > 0.5):
		dupePageInst2.get_child(3).get_child(2).Xmin = "0"
		dupePageInst2.get_child(3).get_child(2).Ymin = "0"
		dupePageInst2.get_child(3).get_child(2).Xmax = str(snapped(randf() * 7, 0.01))
		dupePageInst2.get_child(3).get_child(2).Ymax = str(output)
		dupePageInst2.get_child(3).get_child(2).Xunit = "Time"
		dupePageInst2.get_child(3).get_child(2).Yunit = "Output (MW)"
		if cost > 0:
			dupePageInst2.get_child(3).get_child(2).direction = "up"
		else:
			dupePageInst2.get_child(3).get_child(2).direction = "down"
	else:
		# flipped
		dupePageInst2.get_child(3).get_child(2).Xmin = "0"
		dupePageInst2.get_child(3).get_child(2).Ymin = str(snapped(randf() * 7, 0.01))
		dupePageInst2.get_child(3).get_child(2).Xmax = str(output)
		dupePageInst2.get_child(3).get_child(2).Ymax = "0"
		dupePageInst2.get_child(3).get_child(2).Xunit = "Output (MW)"
		dupePageInst2.get_child(3).get_child(2).Yunit = "Time"
		if cost > 0:
			dupePageInst2.get_child(3).get_child(2).direction = "down"
		else:
			dupePageInst2.get_child(3).get_child(2).direction = "up"
	dupePageInst2.get_child(3).get_child(2).loadValues()









var ominous_projects = [
	"Apex Global\nEnergy Solutions",
	"Core Dynamic\nPower Systems",
	"Unified Energy\nSpectrum",
	"Vector Resource\nGroup",
	"Nexus Applied\nEnergy",
	"Prime Integrated\nPower",
	"Global Spectrum\nEnergy",
	"Dominion Energy\nMatrix",
	"Catalyst Advanced\nPower",
	"Strategic Energy\nFramework",
	"Pinnacle Resource\nDynamics",
	"Meridian Energy\nTechnologies",
	"Frontier Power\nIntegration",
	"Zenith Applied\nResources",
	"Vanguard Energy\nSpectrum",
	"Alpha Resource\nDynamics",
	"Beta Integrated\nPower",
	"Gamma Spectrum\nEnergy",
	"Delta Energy\nMatrix",
	"Epsilon Advanced\nPower",
	"Sigma Resource\nFramework",
	"Theta Resource\nDynamics",
	"Lambda Integrated\nPower",
	"Omega Spectrum\nEnergy"
]

var eco_friendly_projects = [
	"Kappa Energy\nMatrix",
	"Psi Advanced\nPower",
	"Rho Resource\nFramework",
	"Tau Resource\nDynamics",
	"Upsilon Integrated\nPower",
	"Chi Spectrum\nEnergy",
	"Phi Energy\nMatrix",
	"Shell Corp\nEnergies",
	"Energy Solutions\nGroup LLC",
	"Power Systems\nInternational",
	"Resource Dynamics\nCorporation",
	"Advanced Energy\nHoldings",
	"Integrated Power\nVentures",
	"Global Energy\nTechnologies",
	"Strategic Resource\nSystems",
	"Dynamic Power\nSolutions",
	"Applied Energy\nConcepts",
	"Spectrum Resource\nManagement",
	"Energy Matrix\nPartners",
	"Resource Framework\nDynamics",
	"Integrated Systems\nEnergy",
	"Power Spectrum\nHoldings",
	"Resource Dynamics\nInternational",
	"Energy Solutions\nCorporation",
	"Power Systems\nVentures",
	"Resource Holdings\nGroup",
	"Energy Technologies\nLLC"
]
