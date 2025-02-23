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

var aqi_text = {
	"Community Solar Microgrid Implementation": "Community solar microgrid projects help reduce reliance on fossil fuels, significantly decreasing harmful air pollutants. This could result in an AQI improvement of %d, with a reduction of 60 tons of CO₂ emissions and 20 tons of particulate matter. The long-term benefits include improved public health due to cleaner air and reduced respiratory issues in surrounding communities.",
	"Urban Green Roof Expansion": "Expanding urban green roofs helps absorb carbon dioxide and other pollutants, improving urban air quality. The AQI could improve by AQI impact of %d, with a reduction of 15 tons of CO₂ and 5 tons of particulate matter. This project could also contribute to reducing the urban heat island effect, enhancing the overall livability of cities.",
	"Coastal Wetland Restoration Project": "Restoring coastal wetlands improves air quality by filtering pollutants and enhancing carbon sequestration. The AQI could improve by AQI impact of %d, reducing CO₂ by 35 tons and particulate matter by 10 tons. Wetland restoration projects also protect biodiversity and offer natural flood control, which benefits communities living near the coast.",
	"Reforestation and Native Species Planting": "Reforestation and planting native species help absorb CO₂ and purify the air. The AQI could improve by AQI impact of %d, with a reduction of 80 tons of CO₂ and 30 tons of particulate matter. In addition to improving air quality, these projects help combat climate change and restore critical ecosystems.",
	"Public Transportation Electrification": "Electrifying public transportation reduces air pollution from fossil fuel-based vehicles, leading to better air quality. The AQI could improve by AQI impact of %d, with a reduction of 50 tons of CO₂ and 25 tons of particulate matter. Electrification projects also reduce urban traffic congestion, providing additional benefits to public health and mobility.",
	"Sustainable Agriculture and Food Distribution": "Sustainable agricultural practices minimize air pollution by reducing the need for chemical fertilizers and pesticides. The AQI could improve by AQI impact of %d, decreasing CO₂ emissions by 40 tons and particulate matter by 15 tons. The project promotes local food distribution, reducing transportation-related pollution and improving community health.",
	"Wildlife Corridor Development": "Wildlife corridors support biodiversity and can improve air quality by enhancing local ecosystems' natural air filtration. The AQI could improve by AQI impact of %d, with reductions in CO₂ emissions by 20 tons and particulate matter by 10 tons. These projects also help mitigate habitat fragmentation and enhance biodiversity, which benefits both human and wildlife populations.",
	"Water Conservation and Purification Initiative": "Water conservation and purification projects reduce the need for energy-intensive water treatment processes, lowering emissions that contribute to poor air quality. The AQI could improve by AQI impact of %d, reducing CO₂ by 25 tons and particulate matter by 5 tons. Additionally, these initiatives promote sustainability and help preserve water resources for future generations.",
	"Renewable Energy Storage Deployment": "Deploying renewable energy storage solutions supports the use of clean energy and reduces reliance on polluting fossil fuels. The AQI could improve by AQI impact of %d, decreasing CO₂ emissions by 75 tons and particulate matter by 20 tons. Energy storage projects help stabilize renewable energy grids and increase the efficiency of renewable resources.",
	"Habitat Restoration and Invasive Species Removal": "Restoring habitats and removing invasive species supports biodiversity and enhances natural air filtration systems, improving overall air quality. The AQI could improve by AQI impact of %d, with a reduction of 60 tons of CO₂ and 18 tons of particulate matter. These projects also help prevent further environmental degradation and promote ecological resilience.",
	"Solar Farm Construction": "Building solar farms provides clean energy and reduces the need for polluting fossil fuels, leading to significant air quality improvements. The AQI could improve by AQI impact of %d, with a reduction of 150 tons of CO₂ and 30 tons of particulate matter. Solar farms contribute to long-term energy sustainability and help mitigate climate change.",
	"Wind Turbine Installation": "Wind turbine projects generate clean, renewable energy without emitting harmful pollutants, helping to improve air quality. The AQI could improve by AQI impact of %d, reducing CO₂ emissions by 90 tons and particulate matter by 25 tons. Wind energy also offers long-term economic benefits by providing jobs and reducing dependence on fossil fuels.",
	"Hydroelectric Dam Upgrade": "Upgrading hydroelectric dams enhances energy production without releasing pollutants, improving air quality in the surrounding area. The AQI could improve by AQI impact of %d, with a reduction of 65 tons of CO₂ and 20 tons of particulate matter. These upgrades contribute to a more sustainable energy infrastructure and reduce reliance on fossil fuels.",
	"Geothermal Energy Plant Development": "Geothermal energy plants harness clean, renewable energy from the Earth's heat, reducing the need for carbon-emitting energy sources. The AQI could improve by AQI impact of %d, with a reduction of 50 tons of CO₂ and 15 tons of particulate matter. Geothermal energy provides a stable, sustainable energy source with minimal environmental impact.",
	"Biomass Energy Facility Construction": "Biomass energy facilities produce clean energy from organic waste, reducing reliance on fossil fuels and lowering air pollution. The AQI could improve by AQI impact of %d, reducing CO₂ emissions by 40 tons and particulate matter by 12 tons. Biomass energy supports the circular economy by converting waste into valuable energy.",
	"Renewable Energy Grid Interconnection": "Connecting renewable energy grids helps integrate clean energy sources, reducing the use of fossil fuels and lowering air pollution. The AQI could improve by AQI impact of %d, with a reduction of 85 tons of CO₂ and 28 tons of particulate matter. Grid interconnection projects provide more reliable and sustainable energy, reducing the overall environmental footprint.",
	"Energy Efficiency Improvement Program": "Energy efficiency programs reduce energy consumption, decreasing the emissions associated with power generation and improving air quality. The AQI could improve by AQI impact of %d, reducing CO₂ by 55 tons and particulate matter by 18 tons. These programs also help lower energy costs and promote sustainability in buildings and industries.",
	"Sustainable Building Construction": "Constructing sustainable buildings with energy-efficient designs reduces the carbon footprint and lowers the emissions that contribute to poor air quality. The AQI could improve by AQI impact of %d, with a reduction of 30 tons of CO₂ and 10 tons of particulate matter. These buildings also provide healthier indoor environments, improving the quality of life for their occupants.",
	"Electric Vehicle Charging Infrastructure": "Expanding electric vehicle charging infrastructure supports the transition to cleaner transportation, reducing emissions from fossil fuel-powered vehicles. The AQI could improve by AQI impact of %d, reducing CO₂ emissions by 80 tons and particulate matter by 22 tons. This infrastructure enhances the accessibility of electric vehicles, further decreasing urban air pollution.",
	"Smart Grid Technology Deployment": "Deploying smart grid technologies optimizes energy use, reducing waste and lowering emissions associated with energy generation. The AQI could improve by AQI impact of %d, with a reduction of 120 tons of CO₂ and 35 tons of particulate matter. Smart grids provide more efficient energy distribution and support the integration of renewable energy sources into the grid.",
	"Strategic Defoliation Initiative": "Strategic defoliation projects can degrade air quality by releasing carbon dioxide, particulate matter, and other pollutants. These emissions may result in an AQI increase of %d, leading to a rise in the PM2.5 levels by 15 micrograms/m³ of fine particles in the air. This environmental degradation can have a lasting impact on public health, resulting in harmful effects on respiratory health for vulnerable populations.",
	"Deep Bore Nuclear Waste Storage": "Storing nuclear waste in deep bore facilities could lead to the release of radioactive particles into the atmosphere, increasing the AQI. The potential AQI impact could be AQI increase of %d, contributing 28 tons of CO₂ and particulate matter into the atmosphere. The remediation measures for the environmental damage caused could be extensive and could involve long-term air quality monitoring.",
	"Experimental Seismic Testing (Fracking)": "Fracking operations for seismic testing release methane, volatile organic compounds (VOCs), and other harmful pollutants into the atmosphere. This can lead to a AQI impact increase of %d, contributing 65 tons of methane to the air. The environmental cleanup required to address the air quality deterioration may take years and will require rigorous enforcement of regulations.",
	"Remote Arctic Resource Exploitation": "The extraction of natural resources from remote Arctic regions may result in the release of carbon emissions and other pollutants, negatively impacting AQI. This can decrease the AQI by AQI impact of %d, with 100 tons of CO₂ added to the atmosphere. The long-term environmental costs related to the ecosystem disruption and air pollution will be substantial.",
	"Unregulated Deep-Sea Mining": "Deep-sea mining without proper regulation can disturb marine life and release toxic particles into the air. This could reduce AQI by AQI impact of %d, with 42 tons of toxic chemicals entering the air. The negative impact of these chemicals on human health could result in public outcry and potential regulatory changes.",
	"Forced Relocation for Dam Construction": "Forced relocation for large dam projects can lead to deforestation, soil degradation, and the release of pollutants, further decreasing AQI levels. AQI might drop by AQI impact of %d, with an estimated 55 tons of particulate matter and carbon dioxide released into the air. This project’s long-term effects will likely require extensive mitigation efforts to restore air quality in affected areas.",
	"Large-Scale Incineration Project": "Incineration of waste results in the release of harmful particulate matter, dioxins, and other toxins that negatively affect air quality. This could lead to an AQI impact of %d, with 150 tons of emissions released from the incinerators. The impact on public health could be severe, particularly for those in surrounding communities, requiring urgent action to address the deteriorating air quality.",
	"Controversial Pesticide Deployment": "The widespread use of pesticides can release toxic chemicals into the air, leading to poor air quality and a higher AQI. This could worsen AQI by AQI impact of %d, with 30 tons of pesticide chemicals entering the atmosphere. The negative impact of these chemicals on human health could result in public outcry and potential regulatory changes.",
	"Offshore Oil Platform Expansion": "Expanding offshore oil platforms results in more emissions of carbon dioxide and other air pollutants, which degrade AQI. The expansion could lead to an AQI impact of %d, releasing 78 tons of methane and 110 tons of CO₂ into the atmosphere. This will exacerbate air quality issues in nearby coastal and urban areas, potentially leading to more respiratory issues for the population.",
	"Unmonitored Chemical Waste Discharge": "The uncontrolled release of chemical waste into the environment can result in increased pollutants in the air, worsening AQI levels. This could cause AQI to deteriorate by AQI impact of %d, with 25 tons of toxic chemicals released into the atmosphere. The lack of regulation around these discharges can have dangerous long-term consequences for public health.",
	"Tax Haven Resource Transfer": "The transfer of resources to tax havens often leads to a lack of regulation on environmental practices, worsening air quality. The AQI could be affected by a AQI impact of %d, with emissions of 60 tons of CO₂. The lack of oversight and failure to address the resulting environmental damage could lead to negative impacts on air quality in the long term.",
	"Lobby-Driven Regulatory Exemption": "Lobbying for regulatory exemptions can lead to higher emissions of pollutants by relaxing environmental safeguards, worsening AQI. This may result in a AQI impact of %d, with emissions of 35 tons of CO₂ and 50 tons of particulate matter. The cost to address this damage could involve years of restoration efforts for air quality.",
	"Subsidized Fossil Fuel Infrastructure": "Subsidizing fossil fuel infrastructure encourages continued reliance on carbon-intensive energy, leading to increased air pollution. This could degrade AQI by AQI impact of %d, with an additional 90 tons of CO₂ emitted. The long-term environmental cost will involve increased health care expenditures due to the air quality deterioration.",
	"Offshore Data Storage (for tax evasion)": "Offshore data storage centers require large amounts of energy, contributing to higher emissions. The AQI impact is limited, but the increase in energy consumption could lead to an AQI degradation of %d, with an increase of 200 MW to the energy grid. This puts further strain on the energy infrastructure and exacerbates air quality challenges.",
	"Non-Disclosure Agreement Land Acquisition": "Land acquisition via non-disclosure agreements for large-scale development projects can result in unregulated construction practices that harm the environment. AQI could decrease by AQI impact of %d, with construction emissions of 40 tons of particulate matter. The environmental impact might continue to worsen as the project progresses without proper regulation.",
	"Strategic Price Fixing Initiative": "Price fixing initiatives can encourage overproduction and increased industrial emissions, worsening AQI. This could worsen AQI by AQI impact of %d, releasing 85 tons of CO₂ and 20 tons of other pollutants into the air. This is a significant threat to local air quality, affecting millions of people in urban areas.",
	"Environmental Impact Report Suppression": "Suppressing environmental impact reports can allow harmful practices to go unregulated, leading to increased pollution. This could result in an AQI impact of %d, with pollutants like 60 tons of particulate matter and 100 tons of gases being released. The subsequent deterioration in air quality will require extensive and immediate remediation efforts.",
	"Delayed Infrastructure Maintenance": "Delayed maintenance of infrastructure like roads and sewage systems often leads to increased pollution due to inefficient operations. This could result in a AQI impact of %d, with 70 tons of additional pollutants entering the air. The strain on public health systems and local governments to restore air quality could be significant.",
	"Political Campaign Funding (Lobbying)": "Political campaign funding often leads to policies that weaken environmental regulations, causing higher emissions and worsening air quality. This could reduce AQI by AQI impact of %d, releasing 55 tons of particulate matter and other pollutants. The impact on the overall health of affected populations could be severe.",
	"Contract Bid Rigging": "Rigging bids for contracts can lead to the selection of inefficient and polluting construction methods, further degrading AQI. This could worsen AQI by AQI impact of %d, with 80 tons of CO₂ and other pollutants being released. The long-term cost to address the degradation will require extensive environmental restoration projects."
}

var project_cost = {
	"Community Solar Microgrid Implementation": "The construction cost of a community solar microgrid varies based on the size and complexity of the project, with the total cost typically ranging from %cost%. These projects help reduce energy costs for local communities by offering an alternative to traditional energy sources. For example, a microgrid can decrease a community’s carbon emissions by up to 30% and provide power for approximately 1,000 households.",
	"Urban Green Roof Expansion": "The cost of expanding urban green roofs is influenced by factors such as location and scale. Generally, it can range between %cost% depending on the size and design. Expanding green roofs can reduce the city’s average temperature by up to 5°C, improve air quality by capturing about 5,000 tons of CO2 annually, and absorb over 80,000 liters of stormwater per year per acre.",
	"Coastal Wetland Restoration Project": "The cost to restore coastal wetlands can vary widely, depending on the scale and location of the restoration. These costs can range from %cost% for small local projects to larger amounts for extensive regional efforts. Coastal wetlands provide essential benefits, including reducing flood risks by up to 50% in affected areas, increasing fish populations by up to 40%, and supporting 60+ species of migratory birds annually.",
	"Reforestation and Native Species Planting": "Reforestation and native species planting projects often require significant capital, with costs varying from %cost% depending on the size and region of the restoration. These efforts improve biodiversity by planting up to 500,000 native trees in a single year, enhance carbon sequestration, and stabilize soils, reducing erosion by up to 25% in key areas.",
	"Public Transportation Electrification": "Electrifying public transportation systems requires substantial initial investment, typically ranging from %cost%. These transition projects help reduce air pollution by up to 50%, lower greenhouse gas emissions by 10,000 tons annually, and improve urban mobility by increasing transit efficiency, resulting in a 15% faster commute for users.",
	"Sustainable Agriculture and Food Distribution": "Constructing sustainable agricultural systems and improving food distribution channels involve considerable upfront costs, ranging from %cost% depending on the scale and type of technology used. These systems increase crop yields by 20% while cutting food waste by up to 40% and reducing the carbon footprint of food transportation by 35%.",
	"Wildlife Corridor Development": "Developing wildlife corridors requires investment that can vary widely, typically ranging from %cost% depending on the size and ecological importance of the area. These corridors support the migration of approximately 25,000 species annually, reduce wildlife-vehicle collisions by 30%, and help maintain biodiversity by connecting fragmented habitats.",
	"Water Conservation and Purification Initiative": "Water conservation and purification projects often have a significant cost, with expenses ranging from %cost% depending on the technology and geographic area. These systems help regions reduce water consumption by up to 40%, improve water quality for 200,000 residents, and ensure the long-term sustainability of local water resources.",
	"Renewable Energy Storage Deployment": "Deploying renewable energy storage systems, such as large-scale batteries, can involve high construction costs, typically ranging from %cost%. These storage solutions help stabilize the grid by storing up to 20,000 MWh of excess renewable energy annually and improve the efficiency of renewable energy use by 30%, reducing grid dependence on fossil fuels.",
	"Habitat Restoration and Invasive Species Removal": "Habitat restoration and invasive species removal projects can be costly, with a range of %cost% based on the scale and complexity of the project. These efforts remove up to 200 invasive species, restoring over 1,000 acres of native habitat and improving ecological health, supporting 15% higher biodiversity levels in the region.",
	"Solar Farm Construction": "The construction of solar farms requires substantial investment, typically ranging from %cost% depending on the size and location of the farm. Solar farms generate clean, renewable energy capable of powering up to 10,000 homes annually, reducing CO2 emissions by 25,000 tons per year and improving energy resilience in remote areas.",
	"Wind Turbine Installation": "Installing wind turbines involves high upfront costs, typically ranging from %cost% based on the number of turbines and their location. A single wind turbine can generate up to 3 MW of clean energy, providing electricity for around 2,000 households annually and reducing CO2 emissions by over 5,000 tons each year.",
	"Hydroelectric Dam Upgrade": "Upgrading hydroelectric dams can be a costly venture, with project costs varying from %cost%. These upgrades improve power generation efficiency, increasing energy output by up to 15% and providing up to 100,000 homes with clean, renewable energy while reducing water usage by 20% in local communities.",
	"Geothermal Energy Plant Development": "Developing geothermal energy plants requires significant capital, with costs typically ranging from %cost%. These plants produce up to 50 MW of baseload renewable energy annually, reducing the carbon footprint by up to 200,000 tons annually and providing stable, year-round power for communities.",
	"Biomass Energy Facility Construction": "Biomass energy facilities involve considerable costs, generally ranging from %cost% based on the scale of the facility. These facilities process organic waste to produce up to 5 MW of renewable energy per year, reducing waste sent to landfills by 40,000 tons annually and contributing to a circular economy.",
	"Renewable Energy Grid Interconnection": "The cost to establish renewable energy grid interconnections varies depending on the scale of the project, with typical costs ranging from %cost%. These interconnections can increase renewable energy capacity by up to 20%, improve grid reliability, and reduce energy loss during transmission by 10%.",
	"Energy Efficiency Improvement Program": "Implementing energy efficiency improvements involves initial costs that vary based on the scope of the project, typically ranging from %cost%. These programs reduce energy consumption by up to 30% across participating buildings, lowering utility bills and decreasing the environmental impact of energy use by saving 10,000 tons of CO2 annually.",
	"Sustainable Building Construction": "Sustainable building construction requires significant upfront investment, generally ranging from %cost% based on the size and technology used. These buildings feature energy-efficient designs that can cut energy consumption by up to 50% over the building's lifetime, improving indoor air quality and reducing overall environmental impact.",
	"Electric Vehicle Charging Infrastructure": "Constructing electric vehicle (EV) charging infrastructure involves initial costs, typically ranging from %cost% depending on the number of charging stations and their locations. This infrastructure helps support the growing adoption of electric vehicles, facilitating the charging needs of over 100,000 EVs annually and reducing transportation emissions by 20%.",
	"Smart Grid Technology Deployment": "Deploying smart grid technology involves substantial upfront costs, with typical investments ranging from %cost%. These grids improve energy efficiency, reduce energy consumption by up to 20%, and integrate renewable energy sources more effectively, providing more reliable energy distribution across regions and reducing peak demand issues.",
	"Strategic Defoliation\nInitiative": "This project generates revenue through the sale of cleared land for commercial development or agriculture. By removing vast amounts of vegetation, the initiative opens up large areas for real estate or industrial expansion, generating potential revenue in the range of %d annually. Additionally, timber and other natural resources can be sold for significant profits, resulting in the removal of approximately 500 hectares of vegetation annually.",
	
	"Deep Bore Nuclear\nWaste Storage": "The revenue from deep bore nuclear waste storage comes from governments or private corporations paying fees for long-term disposal solutions. The project could generate millions in annual revenue through storage contracts, estimated at %d annually, depending on the scale of the facility and the amount of waste stored. This facility could store approximately 10,000 tons of nuclear waste each year.",
	
	"Experimental Seismic\nTesting (Fracking)": "Seismic testing and fracking operations generate substantial revenue by tapping into natural gas and oil reserves. This project can result in billions of dollars in potential profits, as it enables access to previously untapped fossil fuel sources. Fracking alone contributes around %d per year in revenue, depending on the volume of resources extracted, which may total around 2,000,000 barrels of oil annually.",
	
	"Remote Arctic Resource\nExploitation": "The exploitation of Arctic resources brings in revenue from the extraction of oil, natural gas, and rare minerals. With oil prices and demand for these resources high, this project can generate tens of billions in revenue annually, with projections ranging from %d, depending on the scope and demand for the extracted resources. The operation could extract around 1,000,000 barrels of oil per year from the region.",
	
	"Unregulated Deep-Sea\nMining": "Deep-sea mining generates substantial revenue through the extraction of valuable minerals like cobalt, nickel, and lithium. These minerals are in high demand for use in electronics and renewable energy infrastructure. The revenue from this project could range between %d annually, depending on the size and scale of the operation. The operation could extract approximately 500,000 tons of minerals per year from deep-sea locations.",
	
	"Forced Relocation for\nDam Construction": "The forced relocation of communities for dam construction can generate significant revenue from the sale of the hydropower generated by the dam. The project can bring in hundreds of millions of revenue annually, typically between %d, from energy production and the associated contracts for water management and power distribution. The dam might produce around 5,000,000 megawatt-hours of electricity annually.",
	
	"Large-Scale Incineration\nProject": "Large-scale incineration of waste can generate revenue through the sale of electricity produced from burning waste materials. This project can create tens of millions of dollars annually, with revenue ranging from %d, depending on the volume of waste processed and the energy produced. The incinerator could process approximately 500,000 tons of waste annually.",
	
	"Controversial Pesticide\nDeployment": "The deployment of pesticides creates revenue through the sale of chemicals to farmers and agricultural businesses. These projects could generate anywhere from %d annually, depending on the demand for chemical products and the scale of agricultural operations in the region. The pesticide deployment could cover up to 200,000 hectares of farmland annually.",
	
	"Offshore Oil Platform\nExpansion": "Expanding offshore oil platforms brings in large sums of revenue through the extraction of crude oil and natural gas. This project could generate revenue in the range of %d annually, depending on the size of the platform and the amount of oil extracted, as well as market prices. The platform could extract approximately 100,000 barrels of oil per day.",
	
	"Unmonitored Chemical\nWaste Discharge": "The unregulated discharge of chemical waste can generate short-term revenue for companies by cutting costs on waste disposal. While difficult to estimate with precision, this practice could save companies upwards of %d annually in disposal fees, though it comes with significant long-term environmental and legal risks. The discharge could result in the release of approximately 50,000 tons of chemical waste into the environment annually.",
	
	"Tax Haven Resource\nTransfer": "Transferring resources to tax havens allows companies to avoid taxes and maximize profits. The revenue saved through tax evasion could amount to billions of dollars annually. Depending on the scale of the operation and the value of the assets being transferred, this could lead to savings and revenue increases in the range of %d annually.",
	
	"Lobby-Driven Regulatory\nExemption": "Lobbying for regulatory exemptions enables industries to continue harmful practices, leading to increased profits. By avoiding environmental regulations, companies can save billions in operational costs and avoid fines. This practice can generate revenue increases of %d annually, depending on the industry and scale of operations.",
	
	"Subsidized Fossil Fuel\nInfrastructure": "Subsidizing fossil fuel infrastructure enables continued operation of energy-intensive projects, boosting revenue for oil, gas, and coal companies. This project can generate substantial revenue, with estimates ranging from %d annually in subsidies and increased profits for the companies involved.",
	
	"Offshore Data Storage\n(for tax evasion)": "Offshore data storage allows companies to evade taxes and save on operating costs while continuing to collect profits. This practice could generate savings in the range of %d annually, depending on the size of the operation and the number of businesses utilizing the service.",
	
	"Non-Disclosure Agreement\nLand Acquisition": "Acquiring land through non-disclosure agreements allows developers and corporations to purchase land without public scrutiny, often for industrial or residential projects. The revenue from land sales and subsequent development can reach anywhere from %d annually, depending on the location and scale of the projects.",
	
	"Strategic Price Fixing\nInitiative": "Price fixing enables industries to maintain higher profit margins by controlling market prices. This project can generate billions of dollars in additional revenue for companies involved, with estimated annual profits ranging from %d depending on the industry and market share.",
	
	"Environmental Impact\nReport Suppression": "Suppressing environmental impact reports can allow polluting industries to continue operating without compliance with environmental regulations, increasing their profits. This initiative could generate savings and revenue increases in the range of %d annually, depending on the industries involved.",
	
	"Delayed Infrastructure\nMaintenance": "Delaying infrastructure maintenance allows companies to save on repair and maintenance costs, which leads to higher revenue in the short term. However, these savings come at the expense of long-term infrastructure stability and safety, with revenue increases potentially ranging from %d annually.",
	
	"Political Campaign\nFunding (lobbying)": "Funding political campaigns through lobbying efforts enables companies to secure favorable regulations and contracts, leading to increased revenue. This project could result in revenue gains of %d annually, depending on the effectiveness of lobbying and the industries involved.",
	
	"Contract Bid Rigging": "Rigging contract bids ensures that a specific company wins lucrative contracts, boosting its revenue. This practice can generate significant revenue increases, with estimates ranging from %d annually, depending on the number of contracts rigged and the scale of the projects."
}

var energy_output = {
	"Community Solar\nMicrogrid Implementation": "The energy output of a community solar microgrid can vary depending on the size and scope of the project. Typically, these systems can generate up to %d MW of clean energy annually, with a wattage output of %d MW, enough to power approximately 1,000 homes. Additionally, microgrids can reduce the dependency on the main grid by 25%, helping local communities achieve energy independence and ensuring uninterrupted power during grid failures.",
	
	"Urban Green Roof\nExpansion": "Expanding urban green roofs can provide significant energy benefits, including up to %d MWh of thermal energy savings annually. These green roofs act as natural insulators, reducing building energy use by up to 30% in summer and winter. The energy savings can significantly reduce the need for air conditioning and heating, leading to a more energy-efficient city infrastructure, with a wattage output of %d MW.",
	
	"Coastal Wetland\nRestoration Project": "Coastal wetlands can provide energy benefits through improved energy efficiency for surrounding areas by reducing the frequency and intensity of natural disasters like floods and hurricanes. Restoring these wetlands can also lower the local energy costs associated with disaster recovery by up to 20%, saving significant amounts of energy typically needed for reconstruction. The wetland restoration can also increase natural carbon sequestration by producing up to %d MW of energy annually.",
	
	"Reforestation and\nNative Species Planting": "Reforestation and planting native species helps offset energy consumption by capturing carbon dioxide and reducing the need for energy-intensive carbon mitigation efforts. These projects can absorb up to %d tons of CO2 annually, resulting in energy savings equivalent to %d gallons of gasoline. Additionally, these initiatives could provide up to %d MW of energy generation through enhanced ecosystem services.",
	
	"Public Transportation\nElectrification": "Electrifying public transportation systems can replace fossil-fuel-based energy sources with cleaner, renewable energy. Public transportation electrification can result in energy output savings of up to %d kWh annually, reducing the carbon footprint by 15% and significantly lowering the energy required for transportation over time, with a wattage output of %d MW.",
	
	"Sustainable Agriculture\nand Food Distribution": "By improving agricultural practices and reducing transportation energy costs, sustainable agriculture can provide significant energy savings. This can reduce energy consumption in food production by up to 30%, saving approximately %d kWh of energy annually in food transportation and storage, with a wattage output of %d MW for farming operations.",
	
	"Wildlife Corridor\nDevelopment": "Wildlife corridors can contribute indirectly to energy efficiency by reducing the need for artificial barriers and mitigations that consume energy in infrastructure projects. These corridors can lower the energy costs of transportation routes by 10%, resulting in %d kWh of energy savings annually due to reduced travel time and fuel consumption, with a potential wattage output of %d MW from ecosystem optimization.",
	
	"Water Conservation and\nPurification Initiative": "Water conservation projects can result in substantial energy savings, especially in water purification and desalination processes. Implementing these initiatives can save up to %d kWh annually per facility, reducing the energy typically consumed for water treatment by 20% and helping to secure clean water access for communities with less energy expenditure. The energy generation through improved efficiency can output up to %d MW.",
	
	"Renewable Energy\nStorage Deployment": "Renewable energy storage projects can enhance grid reliability and reduce energy loss by capturing up to %d MWh of excess renewable energy each year. These systems help balance supply and demand and make renewable energy available around the clock, effectively reducing the need for backup fossil fuel power generation by up to 25%, with a wattage output of %d MW during peak periods.",
	
	"Habitat Restoration and\nInvasive Species Removal": "Habitat restoration and invasive species removal help boost the efficiency of local ecosystems. These projects can lead to a reduction in the energy required for ecosystem recovery by up to 15%. For example, when invasive species are removed, native vegetation can grow more efficiently, reducing the energy needed for subsequent restoration efforts. The increased biodiversity can produce up to %d MW of energy savings in local ecosystems.",
	
	"Solar Farm Construction": "Solar farms are a significant source of renewable energy, with typical output ranging from %d MW to %d MW depending on the size of the installation. These solar farms can generate approximately %d MWh annually, enough to power 25,000 homes, and provide energy savings of up to 30% for areas heavily reliant on fossil fuel energy, with a potential wattage output of %d MW during optimal sunlight.",
	
	"Wind Turbine Installation": "Wind turbines can generate substantial amounts of energy. A single turbine can produce up to %d MW of clean electricity annually, powering over 2,000 homes. Large-scale wind farms can generate over %d MW, reducing the need for fossil-fuel-based energy production by up to 40% in the region, with a peak wattage output of %d MW in high winds.",
	
	"Hydroelectric Dam Upgrade": "Upgrading hydroelectric dams can increase energy output by improving the efficiency of turbines and water management systems. These upgrades can increase power generation by up to 15%, yielding additional energy production of around %d MW annually, enough to provide clean energy to 250,000 homes, with a wattage output of %d MW during peak water flow.",
	
	"Geothermal Energy Plant\nDevelopment": "Geothermal energy plants can provide reliable and consistent baseload power. A typical geothermal plant can produce between %d MW and %d MW of energy annually, supplying clean electricity to thousands of homes. These plants can reduce reliance on fossil fuels, avoiding over %d tons of CO2 emissions annually, with a wattage output of %d MW during high demand periods.",
	
	"Biomass Energy Facility\nConstruction": "Biomass energy facilities can generate renewable energy by converting organic waste into power. A typical biomass facility can produce between %d MW and %d MW of energy, reducing landfill waste by up to %d tons annually and providing clean energy for over 15,000 households, with a wattage output of %d MW at full capacity.",
	
	"Renewable Energy Grid\nInterconnection": "Interconnecting renewable energy sources across regions can significantly improve the overall energy output. These interconnections allow for up to 40% more renewable energy to be integrated into the grid, enhancing the overall capacity by %d MW and making renewable energy available at all times, with a potential wattage output of %d MW during peak demand.",
	
	"Energy Efficiency\nImprovement Program": "Energy efficiency programs help reduce energy consumption across a variety of sectors. These improvements can result in an energy savings of up to 30%, amounting to %d kWh annually across participating buildings, lowering overall energy demand and reducing the strain on the energy grid. The total energy output savings can result in an average wattage output of %d MW.",
	
	"Sustainable Building\nConstruction": "Sustainable buildings use energy-efficient materials and technologies, reducing their energy consumption by up to 50% compared to conventional buildings. These buildings can save up to %d kWh annually in energy costs and reduce greenhouse gas emissions by 25%, with a wattage output reduction of up to %d MW in areas with widespread adoption of sustainable building practices.",
	
	"Electric Vehicle\nCharging Infrastructure": "The installation of electric vehicle charging stations increases the adoption of electric vehicles, indirectly improving energy efficiency by reducing overall transportation emissions. EV charging infrastructure can support over %d EVs annually, leading to a 15% reduction in transportation energy consumption in urban areas, with a peak wattage output of %d MW from high usage times.",
	
	"Smart Grid Technology\nDeployment": "Smart grids optimize the distribution of energy, reducing waste and improving overall grid efficiency. They can result in energy savings of up to 20%, improving the delivery of renewable energy and reducing transmission losses by up to 15%. Smart grids can provide real-time data to help balance supply and demand, maximizing energy efficiency and supporting a wattage output of %d MW during peak load times.",
	
	"Strategic Defoliation\nInitiative": "The strategic defoliation initiative could drastically affect the local environment, potentially reducing biodiversity and disrupting ecosystems. In terms of energy output, the environmental degradation could result in the loss of up to %d MW in natural resource production, as the area may lose the capacity to produce sustainable bioenergy. The decrease in vegetation can result in a drop of %d MWh in carbon sequestration annually, which may otherwise contribute to energy savings.",
	
	"Deep Bore Nuclear\nWaste Storage": "Deep bore nuclear waste storage involves the long-term containment of radioactive materials, which poses significant environmental risks. While it may not directly produce energy, its potential hazards can lead to the loss of up to %d MW of renewable energy output by restricting land and water resources for other energy projects. Additionally, the contamination risk can contribute to up to %d tons of CO2 emissions, affecting regional energy generation efforts.",
	
	"Experimental Seismic\nTesting (Fracking)": "Experimental seismic testing and fracking can disrupt geological structures and groundwater, often requiring significant energy to extract fossil fuels. The environmental consequences could decrease energy production from surrounding natural sources by as much as %d MW, including potential impacts on solar and wind projects nearby. The process could also require an additional %d MWh to mitigate the damage done to local energy infrastructure.",
	
	"Remote Arctic Resource\nExploitation": "Exploiting resources in remote Arctic regions can lead to environmental destruction that affects local ecosystems. This can decrease the renewable energy potential of these areas, reducing energy generation by up to %d MW. These regions, which have untapped potential for clean energy production, may also see a loss of up to %d MWh in annual energy output due to disrupted ecosystems and potential contamination.",
	
	"Unregulated Deep-Sea\nMining": "Unregulated deep-sea mining can have severe impacts on oceanic ecosystems, affecting not just marine biodiversity but also energy resources. Mining operations can reduce the potential for energy generation by %d MW by disturbing underwater currents and habitats that support renewable energy projects. The extraction process could lead to the release of up to %d tons of carbon dioxide, which may impact nearby energy-producing areas.",
	
	"Forced Relocation for\nDam Construction": "Constructing large dams often results in the forced relocation of communities and can have serious environmental consequences, including a reduction in nearby renewable energy generation. The displacement could lead to a loss of up to %d MW of energy output from natural resources like forests and rivers, while the dam's construction could require up to %d MWh of energy to complete, further depleting the region's clean energy potential.",
	
	"Large-Scale Incineration\nProject": "Large-scale incineration projects, while potentially generating energy from waste, can result in significant environmental degradation, leading to reduced local energy resources. The incineration process can emit harmful gases and lower energy production from nearby natural sources, resulting in up to %d MW less renewable energy output. This type of project can also consume %d kWh of energy for waste treatment, reducing overall energy efficiency.",
	
	"Controversial Pesticide\nDeployment": "Deploying controversial pesticides can harm ecosystems and reduce biodiversity, affecting the energy output of natural systems. By harming pollinators and plant life, pesticide use can lead to a reduction of up to %d MW in energy production from ecosystems that rely on healthy flora and fauna. The process could also increase energy consumption for recovery efforts by as much as %d MWh annually, reducing the potential for green energy generation.",
	
	"Offshore Oil Platform\nExpansion": "Expanding offshore oil platforms can lead to environmental risks and damage marine ecosystems, which directly impacts the potential for renewable energy generation in the area. This could lead to a decrease of up to %d MW in local clean energy production. Additionally, the expansion might cause %d tons of CO2 emissions, further disrupting the region’s ability to maintain energy sustainability and increasing reliance on non-renewable energy sources.",
	
	"Unmonitored Chemical\nWaste Discharge": "Unmonitored discharge of chemical waste can contaminate water and soil, affecting the energy efficiency of the local environment. The negative impact on ecosystems can reduce renewable energy production by up to %d MW, with an estimated %d MWh of clean energy lost annually as ecosystems suffer from contamination and disruption.",
	
	"Tax Haven Resource\nTransfer": "The transfer of resources to tax havens can reduce the financial investment in renewable energy projects, impacting energy infrastructure development. This financial inefficiency can result in a loss of up to %d MW in energy output, as funds that could have been allocated to renewable projects are diverted away. The resulting energy deficit could reach %d MWh annually, slowing down the transition to a sustainable energy future.",
	
	"Lobby-Driven Regulatory\nExemption": "Lobby-driven regulatory exemptions allow for the continuation of harmful practices that undermine energy sustainability, often leading to an increase in pollution. This can result in a decline of up to %d MW in renewable energy production, as stricter regulations on fossil fuels and emissions are not enforced. The energy lost due to this regulatory exemption could reach %d MWh annually, further stalling clean energy initiatives.",
	
	"Subsidized Fossil Fuel\nInfrastructure": "Subsidizing fossil fuel infrastructure continues to promote energy generation from non-renewable sources, detracting from investment in cleaner energy solutions. This could lead to a reduction of up to %d MW in renewable energy production by diverting resources to fossil fuel projects. The ongoing reliance on these subsidies could also increase energy production costs, adding up to %d kWh annually to energy bills due to inefficient energy infrastructure.",
	
	"Offshore Data Storage\n(for tax evasion)": "Offshore data storage, often used for tax evasion, contributes to environmental degradation by maintaining energy-intensive server farms that rely on non-renewable power sources. These operations can result in an energy loss of up to %d MW, as the servers consume up to %d kWh of energy annually, increasing the reliance on fossil fuels and reducing the availability of energy for renewable projects.",
	
	"Non-Disclosure Agreement\nLand Acquisition": "Land acquisition through non-disclosure agreements often leads to the misuse of land that could otherwise be used for renewable energy projects. This can result in a reduction of up to %d MW in clean energy potential, as valuable land for solar, wind, or geothermal energy is used for other purposes. The land taken could have supported up to %d MWh of renewable energy generation annually.",
	
	"Strategic Price Fixing\nInitiative": "Strategic price fixing, often involving energy markets, manipulates the prices of renewable energy, making it more difficult for consumers and companies to adopt green solutions. This results in a decline of %d MW in energy output from renewable sources, as higher costs deter the expansion of green energy projects. The price manipulation can also delay projects, costing up to %d MWh annually in lost renewable energy potential.",
	
	"Environmental Impact\nReport Suppression": "The suppression of environmental impact reports can prevent important projects that might reduce the harmful effects of energy consumption from being approved. This can lead to a loss of up to %d MW in renewable energy generation, as regulations that might encourage sustainable energy practices are blocked. The environmental damage can also hinder the implementation of energy-saving initiatives, resulting in a potential %d MWh loss of energy savings over time.",
	
	"Delayed Infrastructure\nMaintenance": "Delaying infrastructure maintenance can lead to inefficiencies in energy distribution, causing significant energy losses. This could result in a reduction of up to %d MW in energy output due to failing or outdated equipment. Delaying maintenance could also increase the energy lost through inefficient power lines, contributing to an additional %d MWh loss of energy annually.",
	
	"Political Campaign\nFunding (lobbying)": "Political campaign funding through lobbying often supports energy policies that favor fossil fuel infrastructure over renewable energy projects. This can lead to a decrease in renewable energy production by up to %d MW, as funding for clean energy projects is diverted away. The impact on energy output could result in up to %d MWh of lost renewable energy, further delaying the transition to cleaner energy solutions.",
	
	"Contract Bid Rigging": "Contract bid rigging leads to corruption in the awarding of energy contracts, which can result in inefficient energy projects being chosen over more effective renewable solutions. This can result in a loss of up to %d MW in energy output from more efficient, green energy sources. The corruption could also increase energy costs by up to %d kWh annually, further reducing the potential for clean energy adoption."
}
