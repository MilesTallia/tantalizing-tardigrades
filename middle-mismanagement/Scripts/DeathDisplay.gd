extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_death()
	
func display_death() -> void:
	
	var death_msg : String = ""
	var flash = preload("res://Scenes/Game.tscn")
	print(flash.get_path())
	var game_manager = get_node(flash.get_path())
	#death_msg += "Day number: " + str(game_manager.get_day_num()) + "\n"
	#death_msg += "Money: $" + str(game_manager.get_money()) + "\n"
	#death_msg += "Air quality " + str(game_manager.get_current_atm()) + " AQI\n"
	#death_msg += "Current energy " + str(game_manager.get_current_energy()) + " MW\n"
	#death_msg += "Required energy " + str(game_manager.get_day_num() * 100) + " MW\n"
	
	$Label.text = death_msg

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
