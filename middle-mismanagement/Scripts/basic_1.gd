extends Node2D

var rng = RandomNumberGenerator.new()

func rand(good : bool):
	if (good == true):
		randomize_good()
	else:
		randomize_bad()
	
func randomize_bad():
	var aqi = rng.randf_range(1.0, 6.0)
	var cost = rng.randf_range(0.0, 30.0)
	var output = rng.randf_range(30, 100)
	set_values(aqi, cost, output)
	
func randomize_good():
	var version = rng.randf_range(0, 10)
	if (version <= 8):
		randomize_aqi_reducer()
	else:
		var aqi = 0
		var cost = rng.randf_range(-15.0, 5.0)
		var output = rng.randf_range(40, 80)
		set_values(aqi, cost, output)

func randomize_aqi_reducer():
	var aqi = rng.randf_range(-8, -4)
	var cost = rng.randf_range(-20.0, -10.0)
	var output = 0
	set_values(aqi, cost, output)
	
	

func set_values(aqi, cost, output):
	aqi = snapped(aqi, 0.01)
	cost = snapped(cost, 0.01)
	output = snapped(output, 0.01)
	$AQI.set_child_text(str(aqi))
	if (aqi <= 0):
		$AQI.set_value(Color("green"))
	else:
		$AQI.set_value(Color("red"))
	$Budget.set_child_text(str(cost))
	if (cost >= 0):
		$Budget.set_value(Color("green"))
	else:
		$Budget.set_value(Color("red"))
	$Output.set_child_text(output)
	$Output.set_value(Color(0,0,0))	
	
func _ready():
	rand(true);
