extends CharacterBody2D

@export var stamp = false

var draggingDistance
var dir
var dragging
var newPosition = Vector2()
var mouse_in = false
var chosen = false

func _input(event):
	if (event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_RIGHT) || (event is InputEventKey && event.keycode == KEY_SPACE):
		if chosen and event.is_pressed() && mouse_in:
			MarkFolder()
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if chosen and Input.is_action_pressed("mouse_click") && mouse_in:
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


func chosenVal():
	chosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false
	
func MarkFolder():
	position = get_global_mouse_position()

	var count = len($Area2D.get_overlapping_bodies())
	if (count == 0):
		pass
	elif (count == 1):
		$Area2D.get_overlapping_bodies()[0].get_stamped(stamp)

	else:
		var max_index = -1
		var top_obj = null
		for b in $Area2D.get_overlapping_bodies():
			if (b.z_index > max_index):
				max_index = b.z_index
				top_obj = b
		
		top_obj.get_stamped(stamp)
		#print("stamped")
