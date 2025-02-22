extends Node


var day_num = 0
var money = 10000
var current_atm = 30
var change_atm = 0
var current_energy = 500
var num_folders : int = 3  
var array_folders = null

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
	set_day_num(day_num + 1)
	var debrief_page = get_node("..//DebriefPage")
	debrief_page.set_text()
	# get folders
	
	
func end_day() -> void:
	for folder in array_folders:
		money.set(money + folder.get)
	
	if (money < 0):
		end_money()
	elif (current_atm > 200):
		end_atm()
	elif (current_energy < day_num * 50):
		end_energy()
	else:
		start_day()

func end_money() -> void:
	#do stuff
	end_game()
	
func end_atm() -> void:
	#do stuff
	end_game()
	
func end_energy() -> void:
	#do stuff
	end_game()

func end_game():
	#change scene to end game
	return; 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
