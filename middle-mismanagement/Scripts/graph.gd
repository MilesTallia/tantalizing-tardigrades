extends Node2D

var Xmin = "0"
var Xmax = "0"
var Xunit = "unit"

var Ymin = "0"
var Ymax = "0"
var Yunit = "unit"

var direction = "up"

func _ready() -> void:
	$Xmin.set_text(Xmin)
	$Xmax.set_text(Xmax)
	$Xunit.set_text(Xunit)
	$Ymin.set_text(Ymin)
	$Ymax.set_text(Ymax)
	$Yunit.set_text(Yunit)
	
	if direction == "up":
		$Image.set_texture("res://Assets/Up.png")
	else:
		$Image.set_texture("res://Assets/Down.png")
