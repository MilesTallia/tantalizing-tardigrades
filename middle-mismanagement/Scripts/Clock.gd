extends Node

var end_time
var cur_time = 0
var running = false
var finished = false

func start(time_seconds: int) -> void:
	cur_time = 0
	end_time = float(time_seconds + 1)
	running = true
	finished = false

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cur_time += delta
	if finished:
		var tail = cur_time - int(cur_time)
		if tail > 0.5:
			# blink on
			$Label.add_theme_color_override("font_color", "WHITE")
		else:
			# blink off
			$Label.add_theme_color_override("font_color", "RED")
		if cur_time >= end_time + 3.0:
			var gamemanager = get_parent().get_node("..//GameManager")
			gamemanager.end_day()
			pass
	elif running:		
		# update display
		var min = int((end_time - cur_time) / 60)
		var sec = int((end_time - cur_time) - (min * 60))
		var pad = ""
		if sec < 10:
			pad = "0"
		$Label.text = str(min) + ":" + pad + str(sec)
		
		if cur_time >= end_time - 1.0:
			# we done
			print("Time's up!")
			running = false
			finished = true
