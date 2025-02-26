extends Area2D


func _ready():
	pass
	
func _process(delta):
	position = get_global_mouse_position()

	var count = len(get_overlapping_bodies())
	if (count == 0):
		pass
	elif (count == 1):
		get_overlapping_bodies()[0].chosenVal()
		if (Input.is_action_just_pressed("mouse_click")):
			get_parent().push_obj_to_top(get_overlapping_bodies()[0])

	else:
		var max_index = -1
		var top_obj = null
		for b in get_overlapping_bodies():
			if (b.z_index > max_index):
				max_index = b.z_index
				top_obj = b
		
		top_obj.chosenVal()
		for b in get_overlapping_bodies():
			if b != top_obj:
				b.chosen = false
		if (Input.is_action_just_pressed("mouse_click")):
			get_parent().push_obj_to_top(top_obj)
