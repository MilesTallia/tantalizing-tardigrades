extends Node2D

var obj_stack = []

var paper_scene = preload("res://Scenes/Paper.tscn")
@onready var pause_menu = $Camera2D/pause_menu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0, 2):
		var paper = paper_scene.instantiate()
		add_obj(paper)
	pause_menu.hide()
	Engine.time_scale = 1;

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

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1;
	else:
		pause_menu.show()
		Engine.time_scale = 0;
	paused = !paused;
