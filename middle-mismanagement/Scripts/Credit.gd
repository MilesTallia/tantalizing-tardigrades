extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/Launch.tscn")



func _on_miles_pressed() -> void:
	OS.shell_open("https://www.linkedin.com/in/miles-tallia/")


func _on_gabriel_pressed() -> void:
	OS.shell_open("https://www.linkedin.com/in/gabriel-williams-17a400272/")


func _on_andrew_pressed() -> void:
	OS.shell_open("https://www.linkedin.com/in/andrew-dimauro-765565311/")


func _on_max_pressed() -> void:
	OS.shell_open("https://linkedin.com/in/maxrimlinger")
