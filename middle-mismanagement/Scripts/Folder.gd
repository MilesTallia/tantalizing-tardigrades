extends Node

var open = false
var hasPapers = true

func on_click(viewport:Node, event:InputEvent, shape_idx:int) -> void:
	if event is InputEventMouseButton:
		if not event.is_pressed(): # on mouse up
			if not open:
				hasPapers = false
				$Paper.visible = false
				# TODO spawn papers
			open = not open

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
