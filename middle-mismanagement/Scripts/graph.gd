extends Node2D

var Xmin = "0"
var Xmax = "0"
var Xunit = "unit"

var Ymin = "0"
var Ymax = "0"
var Yunit = "unit"

var direction = "up"
var up = preload("res://Assets/Up.png")
var down = preload("res://Assets/Down.png")

func loadValues():
	print("Loading Values Into Graph ...")
	$Xmin.set_text(Xmin)
	$Xmax.set_text(Xmax)
	$Xunit.set_text(Xunit)
	$Ymin.set_text(Ymin)
	$Ymax.set_text(Ymax)
	$Yunit.set_text(Yunit)
	
	if direction == "up":
		$Image.set_texture(up)
	else:
		$Image.set_texture(down)
