extends CharacterBody2D

var old_position = position

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var chosen = false
var zoomed = false

func _is_pos_in(checkpos:Vector2):
	var gp = get_global_transform().get_origin()
	var lr = $CollisionShape2D.shape.get_rect()
	var gr = Rect2(gp.x - (lr.size.x), gp.y - (lr.size.y), lr.size.x * 2, lr.size.y * 2)
	return checkpos.x>=gr.position.x and checkpos.y>=gr.position.y and checkpos.x<gr.end.x and checkpos.y<gr.end.y

func _input(event):
	if event is InputEventMouseButton:
		if zoomed:
			if _is_pos_in(event.position):
				if event.double_click:
					scale = Vector2(1, 1)
					zoomed = false
			else:
				if event.is_pressed():
					scale = Vector2(1, 1)
					zoomed = false
		else:
			if chosen and event.is_pressed() and mouse_in:
				draggingDistance = position.distance_to(get_viewport().get_mouse_position())
				dir = (get_viewport().get_mouse_position() - position).normalized()
				dragging = true
				newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
				if event.double_click:
					scale = Vector2(2,2)
					old_position = position
					position = Vector2(DisplayServer.window_get_size().x/2,DisplayServer.window_get_size().y/2)
					dragging = false
					zoomed = true
			else:
				dragging = false
				chosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(delta):
	if dragging and not zoomed:
		scale = Vector2(1,1)
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()


func chosenVal():
	chosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false
