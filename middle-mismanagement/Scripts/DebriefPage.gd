extends CharacterBody2D


var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var chosen = false
var zoomed = false

func _is_pos_in(checkpos:Vector2):
	var gp = get_global_transform().get_origin()
	var lr = $CollisionShape2D.shape.get_rect()
	var gr = Rect2(gp.x - (lr.size.x), gp.y - (lr.size.y), lr.size.x * 2, lr.size.y * 2)
	return checkpos.x>=gr.position.x and checkpos.y>=gr.position.y and checkpos.x<gr.end.x and checkpos.y<gr.end.y

func _input(event):
	if event is InputEventMouseButton:
		if zoomed and event.is_pressed() and not _is_pos_in(event.position):
			scale = Vector2(1.7, 0.8)
			zoomed = false
		elif chosen and event.is_pressed() and mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
			if event.double_click:
				if zoomed:
					scale = Vector2(1.7, 0.8)
					zoomed = false
				else:
					scale = Vector2(3 * 1.7,3 * 0.8)
					dragging = false
					zoomed = true
		else:
			dragging = false
			chosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(delta):
	if dragging:
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()


func chosenVal():
	chosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false


func set_text():
	var gameManager = get_node("..//GameManager")
	var debrief_test:String = ""
	
	var code1 = 0
	var code2 = 0
	var code3 = 0
	if gameManager.get_current_atm() > 120:
		code1 = 1
	if gameManager.get_money() > 50000:
		code2 = 1
	if gameManager.get_current_energy() - gameManager.get_day_num() * 100 > 250:
		code3 = 1
	debrief_test += sentences[str(code1) + str(code2) + str(code3)] + "\n       \n"
	debrief_test += "Day number: " + str(gameManager.get_day_num()) + "\n"
	debrief_test += "Air quality " + str(gameManager.get_current_atm()) + " AQI" + " + " + str(gameManager.get_change_atm()) + "/d\n"
	debrief_test += "Money: $" + str(snapped(float(gameManager.get_money()) / 1000.0, 0.01)) + "K\n"
	debrief_test += "Current energy " + str(gameManager.get_current_energy()) + " MW\n"
	debrief_test += "Required energy " + str(gameManager.get_day_num() * 100) + " MW\n"
	$Label.text = debrief_test

var sentences = {
	"000" = "The beautiful town of Kalamazoo smells amazing, the air quality so pure it melts your heart. Unfortunately... Kalamazoo is completely broke and making no energy.",
	"100" = "Kalamazoo has truly fallen on hard times. Not only being completely destitute and lacking electricity, but also suffering from horrendous air pollution. How on earth did this even happen?",
	"010" = "What a beautiful day to go outside! The air is great and Kalamazoo's pockets are heavy with coin. Unfortunately it's best if you stay outside as the lack of energy production has led to houses not hacing ac :( ",
	"001" = "The magnificently beautiful and fantastically broke town of Kalamazoo seems to be producing a LOT of electricity! Good for them :) ",
	"110" = "Corporate greed has struck again. This time taking Kalamazoo, a once beautiful town has been overun by factories and hardships, but at great success for the rich businessmen of the area. Oh yeah, and the air sucks.",
	"101" = "The townspeaple of Kalamazoo have taken to staying inside, away from the polluted air outside and staying comfortable in their nicely powered homes, hoping they have enough money for tomorrow.",
	"011" = "Kalamazoo is thriving! Such a beautiful place to live, birds singing on treetops, shiny coins strewn around the streets, and sweet sweet air conditioning in every household!",
	"111" = "The people of Kalamazoo walk the town in masks, it's a pain to go outside but everybody is intent to go out shopping on the weekend with their disposable incomes.They spend time at their arcades theeaters and ultra-high-powered-go-kart-arenas."
}
