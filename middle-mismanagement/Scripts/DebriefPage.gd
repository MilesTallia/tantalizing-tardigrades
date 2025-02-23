extends CharacterBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var chosen = false

func _input(event):
	if event is InputEventMouseButton:
		if chosen and event.is_pressed() && mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
		else:
			dragging = false
			chosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(delta):
	if dragging:
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()

func set_text():
	var gameManager = get_node("..//GameManager")
	var debrief_test:String = ""
	debrief_test += "Day number: " + str(gameManager.get_day_num()) + "\n"
	debrief_test += "Money: $" + str(gameManager.get_money()) + "\n"
	debrief_test += "Air quality " + str(gameManager.get_current_atm()) + " AQI\n"
	debrief_test += "Current energy " + str(gameManager.get_current_energy()) + " MW\n"
	debrief_test += "Required energy " + str(gameManager.get_day_num() * 100) + " MW\n"
	$Label.text = debrief_test

func chosenVal():
	chosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false
