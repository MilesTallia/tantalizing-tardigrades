extends Node2D

var obj_stack = []

var paper_scene = preload("res://Scenes/Paper.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 2):
		var paper = paper_scene.instantiate()
		add_obj(paper)

func add_obj(obj):
	obj_stack.append(obj)
	
	var count = 0
	for p in obj_stack:
		if (!is_instance_valid(p)):
			obj_stack.erase(p)
			continue
		p.z_index = count
		
		count += 1

func push_obj_to_top(obj):
	obj_stack.erase(obj)
	add_obj(obj)
