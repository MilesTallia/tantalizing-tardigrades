extends Node2D

var rng = RandomNumberGenerator.new()

func rand(good : bool):
	if (good == true):
		randomize_good()
	else:
		randomize_bad()
		
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
	
func randomize_good():
	var version = rng.randf_range(0, 10)
	if (version >= 8):
		randomize_aqi_reducer()
	else:
		var proj = randomize_project(true)
		var aqi = 0
		var cost = rng.randf_range(-15.0, 5.0)
		var output = rng.randf_range(40, 80)
		set_values(proj, aqi, cost, output)

func randomize_aqi_reducer():
	var proj = randomize_project(true)
	var aqi = rng.randf_range(-8, -4)
	var cost = rng.randf_range(-20.0, -10.0)
	var output = 0
	set_values(proj, aqi, cost, output)
	
	

func set_values(project, aqi, cost, output):
	project = project.replace("\n", " ") 
	$Title.set_child_text(project)
	aqi = snapped(aqi, 0.01)
	cost = snapped(cost, 0.01)
	output = snapped(output, 0.01)
	
	var sentences = [1,2,3]
	var sent = sentences.pick_random()
	sentences.erase(sent)
	var s = get_node(str(sent))
	
	s.set_text(aqi_impacts[project] % [str(aqi*0.75), str(aqi*0.25)])
	sent = sentences.pick_random()
	sentences.erase(sent)
	s = get_node(str(sent))
	
	s.set_text(project_costs[project] % cost)
	sent = sentences.pick_random()
	sentences.erase(sent)
	s = get_node(str(sent))
	
	s.set_text(project_energy_output[project] % output)


func _ready() -> void:
	rand(true)





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
	"Smart Grid Technology\nDeployment"
]

var project_costs = {
	# Sustainable Projects
	"Community Solar Microgrid Implementation": "The cost of implementing the solar microgrid is estimated to be %s million dollars.",
	"Urban Green Roof Expansion": "The expansion of green roofs across urban areas will cost approximately %s million dollars.",
	"Coastal Wetland Restoration Project": "The restoration project for coastal wetlands is expected to cost %s million dollars.",
	"Reforestation and Native Species Planting": "Reforestation efforts and planting native species will require an investment of %s million dollars.",
	"Public Transportation Electrification": "Electrifying public transportation systems is projected to cost %s million dollars.",
	"Sustainable Agriculture and Food Distribution": "The cost to implement sustainable agriculture and food distribution systems is estimated at %s million dollars.",
	"Wildlife Corridor Development": "Developing wildlife corridors to reconnect ecosystems is estimated to cost %s million dollars.",
	"Water Conservation and Purification Initiative": "The water conservation and purification initiative will cost approximately %s million dollars.",
	"Renewable Energy Storage Deployment": "Deploying renewable energy storage solutions will require an investment of %s million dollars.",
	"Habitat Restoration and Invasive Species Removal": "The cost of habitat restoration and invasive species removal is projected to be %s million dollars.",
	"Solar Farm Construction": "Building a solar farm will cost around %s million dollars in total.",
	"Wind Turbine Installation": "The installation of wind turbines is projected to cost %s million dollars.",
	"Hydroelectric Dam Upgrade": "Upgrading hydroelectric dams is expected to cost %s million dollars.",
	"Geothermal Energy Plant Development": "Developing a geothermal energy plant will require an investment of %s million dollars.",
	"Biomass Energy Facility Construction": "The construction of a biomass energy facility is expected to cost %s million dollars.",
	"Renewable Energy Grid Interconnection": "The cost of interconnecting renewable energy sources to the grid is %s million dollars.",
	"Energy Efficiency Improvement Program": "Implementing energy efficiency improvements across systems is estimated to cost %s million dollars.",
	"Sustainable Building Construction": "Constructing sustainable buildings will require an estimated %s million dollars.",
	"Electric Vehicle Charging Infrastructure": "Expanding electric vehicle charging infrastructure will cost around %s million dollars.",
	"Smart Grid Technology Deployment": "Deploying smart grid technology is expected to cost %s million dollars.",

	# Harmful Projects (with money gained)
	"Strategic Defoliation Initiative": "The defoliation initiative is expected to generate a profit of %s million dollars from increased agricultural yields.",
	"Deep Bore Nuclear Waste Storage": "Storing nuclear waste deep underground is expected to generate revenue of %s million dollars from waste disposal contracts.",
	"Experimental Seismic Testing (Fracking)": "Fracking and seismic testing will generate an income of %s million dollars through resource extraction deals.",
	"Remote Arctic Resource Exploitation": "Exploiting resources in the Arctic will bring in %s million dollars from mining and oil extraction.",
	"Unregulated Deep-Sea Mining": "Deep-sea mining without regulation could generate profits of %s million dollars from mineral extraction.",
	"Forced Relocation for Dam Construction": "Forced relocation for dam construction could lead to profits of %s million dollars through development and land deals.",
	"Large-Scale Incineration Project": "Large-scale incineration of waste could generate %s million dollars through waste processing contracts.",
	"Controversial Pesticide Deployment": "Deploying controversial pesticides is expected to generate %s million dollars from agricultural industry contracts.",
	"Offshore Oil Platform Expansion": "Expanding offshore oil platforms is expected to yield %s million dollars from increased oil production.",
	"Unmonitored Chemical Waste Discharge": "Unmonitored chemical waste discharge will result in profit gains of %s million dollars from reduced operational costs.",
	"Tax Haven Resource Transfer": "Transferring resources through tax havens could lead to profits of %s million dollars by evading taxation.",
	"Lobby-Driven Regulatory Exemption": "Lobby-driven regulatory exemptions are expected to generate %s million dollars in savings through fewer environmental constraints.",
	"Subsidized Fossil Fuel Infrastructure": "Subsidizing fossil fuel infrastructure will lead to an income of %s million dollars through expanded fuel production.",
	"Offshore Data Storage (for tax evasion)": "Offshore data storage for tax evasion purposes will generate %s million dollars by reducing costs related to taxation and regulations.",
	"Non-Disclosure Agreement Land Acquisition": "Land acquisition via non-disclosure agreements will lead to profits of %s million dollars from undisclosed development projects.",
	"Strategic Price Fixing Initiative": "Price fixing in the fossil fuel sector will generate %s million dollars in additional profits for participating companies.",
	"Environmental Impact Report Suppression": "Suppressing environmental impact reports will save %s million dollars in avoided environmental mitigation costs.",
	"Delayed Infrastructure Maintenance": "Delaying infrastructure maintenance will save %s million dollars in short-term operational costs but will increase long-term costs.",
	"Political Campaign Funding (Lobbying)": "Political lobbying and campaign funding will generate %s million dollars by influencing regulations in favor of polluting industries.",
	"Contract Bid Rigging": "Rigging contracts in favor of certain companies will generate %s million dollars in profits through unfair contract allocations."
}

var project_energy_output = {
	# Sustainable Projects
	"Community Solar Microgrid Implementation": "The solar microgrid is projected to generate %s MWh of energy annually.",
	"Urban Green Roof Expansion": "Green roofs across urban areas will produce %s MWh of energy each year.",
	"Coastal Wetland Restoration Project": "Coastal wetland restoration will offset %s MWh of energy emissions annually.",
	"Reforestation and Native Species Planting": "Reforestation efforts will help sequester %s MWh of carbon annually.",
	"Public Transportation Electrification": "Electrifying public transportation is expected to save %s MWh of energy per year.",
	"Sustainable Agriculture and Food Distribution": "Sustainable agriculture and food distribution will reduce energy consumption by %s MWh annually.",
	"Wildlife Corridor Development": "Wildlife corridors will help conserve %s MWh of energy by preventing ecosystem fragmentation.",
	"Water Conservation and Purification Initiative": "Water conservation efforts will save %s MWh annually by reducing energy-intensive processes.",
	"Renewable Energy Storage Deployment": "Renewable energy storage will increase energy efficiency by %s MWh per year.",
	"Habitat Restoration and Invasive Species Removal": "Habitat restoration and removal of invasive species will conserve %s MWh of energy annually.",
	"Solar Farm Construction": "The solar farm will generate %s MWh of energy each year.",
	"Wind Turbine Installation": "The wind turbines are expected to generate %s MWh of energy annually.",
	"Hydroelectric Dam Upgrade": "Upgrading the hydroelectric dam will increase energy production by %s MWh per year.",
	"Geothermal Energy Plant Development": "The geothermal plant will generate %s MWh of energy annually.",
	"Biomass Energy Facility Construction": "The biomass facility will produce %s MWh of energy annually.",
	"Renewable Energy Grid Interconnection": "Connecting renewable energy sources to the grid will produce %s MWh of energy each year.",
	"Energy Efficiency Improvement Program": "Energy efficiency improvements will save %s MWh of energy per year.",
	"Sustainable Building Construction": "Sustainable building construction will reduce energy demand by %s MWh annually.",
	"Electric Vehicle Charging Infrastructure": "The electric vehicle infrastructure will support %s MWh of charging annually.",
	"Smart Grid Technology Deployment": "Smart grids are expected to optimize %s MWh of energy use per year.",

	# Harmful Projects
	"Strategic Defoliation Initiative": "Defoliation initiatives will increase energy consumption by %s MWh annually.",
	"Deep Bore Nuclear Waste Storage": "Nuclear waste storage could lead to an increase of %s MWh in energy usage due to maintenance.",
	"Experimental Seismic Testing (Fracking)": "Seismic testing and fracking could produce an additional %s MWh of energy emissions annually.",
	"Remote Arctic Resource Exploitation": "Exploiting Arctic resources will generate an additional %s MWh of energy consumption per year.",
	"Unregulated Deep-Sea Mining": "Unregulated deep-sea mining could result in %s MWh of increased energy consumption annually.",
	"Forced Relocation for Dam Construction": "Forced relocation due to dam construction will increase energy demand by %s MWh each year.",
	"Large-Scale Incineration Project": "Incinerating waste on a large scale will produce %s MWh of energy emissions annually.",
	"Controversial Pesticide Deployment": "Deploying pesticides will increase energy usage by %s MWh annually.",
	"Offshore Oil Platform Expansion": "Offshore oil platform expansion will contribute %s MWh of energy to the market each year.",
	"Unmonitored Chemical Waste Discharge": "Chemical waste discharge could increase energy consumption by %s MWh annually.",
	"Tax Haven Resource Transfer": "Transferring resources through tax havens will increase energy use by %s MWh annually.",
	"Lobby-Driven Regulatory Exemption": "Exemptions from environmental regulations will contribute to %s MWh of additional energy use.",
	"Subsidized Fossil Fuel Infrastructure": "Subsidizing fossil fuel infrastructure will lead to %s MWh of energy emissions each year.",
	"Offshore Data Storage (for tax evasion)": "Storing data offshore will increase energy consumption by %s MWh annually.",
	"Non-Disclosure Agreement Land Acquisition": "Land acquisition via non-disclosure agreements could raise energy demand by %s MWh per year.",
	"Strategic Price Fixing Initiative": "Price fixing will increase energy consumption by %s MWh annually by maintaining high fossil fuel usage.",
	"Environmental Impact Report Suppression": "Suppressing reports will contribute %s MWh of energy usage due to unregulated activities.",
	"Delayed Infrastructure Maintenance": "Delayed infrastructure maintenance could increase energy consumption by %s MWh annually.",
	"Political Campaign Funding (Lobbying)": "Political lobbying to push for lower regulations could raise energy consumption by %s MWh annually.",
	"Contract Bid Rigging": "Bid rigging could slow the deployment of energy-efficient solutions, costing an additional %s MWh of energy."
}

var aqi_impacts = {
	# Sustainable Projects
	"Community Solar Microgrid Implementation": "Reducing reliance on fossil fuel-based power plants could lower AQI from %s (Unhealthy) to %s (Moderate) by decreasing emissions.",
	"Urban Green Roof Expansion": "Increasing rooftop vegetation could filter pollutants, improving AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate) in densely populated areas.",
	"Coastal Wetland Restoration Project": "Restored wetlands can trap airborne pollutants and mitigate emissions, reducing AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Reforestation and Native Species Planting": "Large-scale tree planting can absorb CO₂ and pollutants, potentially improving AQI from %s (Unhealthy) to %s (Moderate).",
	"Public Transportation Electrification": "Replacing diesel-powered transit with electric alternatives could decrease AQI from %s (Unhealthy) to %s (Moderate) by cutting tailpipe emissions.",
	"Sustainable Agriculture and Food Distribution": "Reducing emissions from transportation, fertilizer use, and food waste could improve AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Wildlife Corridor Development": "Preventing deforestation and vehicle congestion in sensitive areas could enhance AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Water Conservation and Purification Initiative": "Reducing energy-intensive water treatment emissions could help stabilize AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Renewable Energy Storage Deployment": "Efficient energy storage reduces fossil fuel dependency, improving AQI from %s (Unhealthy) to %s (Moderate) by enabling clean energy use.",
	"Habitat Restoration and Invasive Species Removal": "Strengthening natural ecosystems can enhance air purification, reducing AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Solar Farm Construction": "Shifting to solar power instead of coal plants could reduce AQI from %s (Very Unhealthy) to %s (Moderate) by cutting emissions.",
	"Wind Turbine Installation": "Increased wind energy production could replace fossil fuel-based power generation, lowering AQI from %s (Unhealthy) to %s (Moderate).",
	"Hydroelectric Dam Upgrade": "Improving dam efficiency reduces reliance on fossil fuels, potentially improving AQI from %s (Unhealthy) to %s (Moderate).",
	"Geothermal Energy Plant Development": "Expanding geothermal energy could displace fossil fuel power, improving AQI from %s (Very Unhealthy) to %s (Moderate).",
	"Biomass Energy Facility Construction": "Implementing clean-burning biomass technology could stabilize AQI from %s (Unhealthy) to %s (Moderate) by reducing reliance on coal.",
	"Renewable Energy Grid Interconnection": "Connecting renewable sources to the grid could lower AQI from %s (Unhealthy) to %s (Moderate) by reducing fossil fuel emissions.",
	"Energy Efficiency Improvement Program": "Cutting overall energy demand through efficiency measures could help reduce AQI from %s (Unhealthy for Sensitive Groups) to %s (Moderate).",
	"Sustainable Building Construction": "Eco-friendly buildings reduce emissions from construction and operations, improving AQI from %s (Unhealthy) to %s (Moderate).",
	"Electric Vehicle Charging Infrastructure": "Expanding EV charging access could reduce gasoline vehicle emissions, improving AQI from %s (Unhealthy) to %s (Moderate).",
	"Smart Grid Technology Deployment": "An intelligent energy grid optimizes electricity use, potentially lowering AQI from %s (Unhealthy) to %s (Moderate) by reducing power plant emissions.",

	# Harmful Projects
	"Strategic Defoliation Initiative": "Large-scale deforestation could increase airborne dust and CO₂, worsening AQI from %s (Moderate) to %s (Unhealthy).",
	"Deep Bore Nuclear Waste Storage": "Potential gas leaks or radioactive contamination could degrade air quality from %s (Moderate) to %s (Unhealthy) in affected areas.",
	"Experimental Seismic Testing (Fracking)": "Released methane and volatile organic compounds (VOCs) could elevate AQI from %s (Moderate) to %s (Unhealthy).",
	"Remote Arctic Resource Exploitation": "Increased fossil fuel extraction and combustion could push AQI from %s (Moderate) to %s (Unhealthy), even in previously clean regions.",
	"Unregulated Deep-Sea Mining": "Disturbed oceanic sediments could release toxic aerosols, raising AQI from %s (Moderate) to %s (Unhealthy for Sensitive Groups).",
	"Forced Relocation for Dam Construction": "Demolition and land clearing could generate dust and emissions, worsening AQI from %s (Moderate) to %s (Unhealthy).",
	"Large-Scale Incineration Project": "Burning waste without proper filtration could spike AQI from %s (Unhealthy for Sensitive Groups) to %s (Hazardous).",
	"Controversial Pesticide Deployment": "Aerosolized pesticides could introduce toxic particulates, pushing AQI from %s (Moderate) to %s (Unhealthy) in affected areas.",
	"Offshore Oil Platform Expansion": "Increased flaring and emissions could lead to AQI deterioration from %s (Moderate) to %s (Very Unhealthy).",
	"Unmonitored Chemical Waste Discharge": "Airborne chemical byproducts could raise AQI from %s (Moderate) to %s (Very Unhealthy) due to toxic fumes.",
	"Tax Haven Resource Transfer": "Increased unsustainable resource exploitation could degrade AQI from %s (Moderate) to %s (Unhealthy) in affected regions.",
	"Lobby-Driven Regulatory Exemption": "Weakening environmental protections could result in increased emissions, pushing AQI from %s (Unhealthy for Sensitive Groups) to %s (Unhealthy).",
	"Subsidized Fossil Fuel Infrastructure": "Encouraging fossil fuel expansion could worsen AQI from %s (Unhealthy for Sensitive Groups) to %s (Hazardous).",
	"Offshore Data Storage (for tax evasion)": "Increased energy demand from unregulated data centers could push AQI from %s (Moderate) to %s (Unhealthy) due to reliance on fossil fuels.",
	"Non-Disclosure Agreement Land Acquisition": "Covert industrial projects could introduce unexpected pollution, raising AQI from %s (Moderate) to %s (Unhealthy).",
	"Strategic Price Fixing Initiative": "Artificially lowered fossil fuel prices could increase consumption, worsening AQI from %s (Unhealthy for Sensitive Groups) to %s (Very Unhealthy).",
	"Environmental Impact Report Suppression": "Lack of transparency could enable unchecked pollution, deteriorating AQI from %s (Unhealthy for Sensitive Groups) to %s (Hazardous).",
	"Delayed Infrastructure Maintenance": "Poor maintenance of transportation and energy systems could increase emissions, pushing AQI from %s (Unhealthy for Sensitive Groups) to %s (Very Unhealthy).",
	"Political Campaign Funding (Lobbying)": "Policy shifts favoring polluters could worsen AQI from %s (Unhealthy for Sensitive Groups) to %s (Unhealthy) due to deregulation.",
	"Contract Bid Rigging": "Inflated costs for cleaner technology could slow sustainability efforts, causing AQI to remain at %s (Unhealthy) rather than improving."
}
