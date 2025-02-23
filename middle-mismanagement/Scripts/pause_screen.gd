extends Node2D

@onready var pause_menu = $Camera2D/pause_menu
var paused = false

func _ready():
	pause_menu.hide()
	Engine.time_scale = 1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
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
