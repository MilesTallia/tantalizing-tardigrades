extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	
func _on_exit_pressed():
	get_tree().quit()
	
func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://Scenes/Tutorial.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/Credits.tscn")
