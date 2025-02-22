extends Node


var day_num = 0
var money = 10000
var current_atm = 10
var change_atm = 0
var current_happiness = 500
var num_folders = 3
var array_folders = Array[num_folders]
var debriefPage = null

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
	
func get_current_happiness() -> int:
	return current_happiness
	
func set_current_happiness(value :int) -> void:
	day_num = current_happiness
	
func get_num_folders() -> int:
	return num_folders
	
func set_num_folders(value :int) -> void:
	num_folders = value
	
func get_array_folders() -> Array[get_num_folders()]:
	return array_folders
	

	
func get_debriefPage() -> Object:
	return debriefPage
	
func set_debriefPage() -> void:
	debriefPage = null
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
func start_day() -> void:
	day_num.set(day_num + 1)
	# get folders and create debreif page
	
	
func end_day() -> void:
	for folder in array_folders:
		money.set(money + folder.get)
	start_day()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
