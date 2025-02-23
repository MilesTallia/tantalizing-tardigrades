extends CharacterBody2D

var draggingDistance
var dir
var dragging
var newPosition = Vector2()

var mouse_in = false
var chosen = false

# specific to folder
var open = false
var hasPapers = true

var difficulty = 1
var good = true
var company = "<<Company>>"
var stamped = false;

func _input(event):
	if event is InputEventMouseButton:
		if chosen and event.is_pressed() && mouse_in:
			draggingDistance = position.distance_to(get_viewport().get_mouse_position())
			dir = (get_viewport().get_mouse_position() - position).normalized()
			dragging = true
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir
			if event.double_click:
				
				
				if !open and hasPapers:
					spawn_pages()
				
				hasPapers = false
				$"Closed Folder/Paper".visible = false
				if open:
					$"Open Folder".visible = false
					$"Closed Folder".visible = true
					open = false
				else:
					$"Open Folder".visible = true
					$"Closed Folder".visible = false
					open = true
				dragging = false
		else:
			dragging = false
			chosen = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			newPosition = get_viewport().get_mouse_position() - draggingDistance * dir

func _physics_process(delta):
	if dragging:
		scale = Vector2(1,1)
		set_velocity((newPosition - position) * Vector2(30, 30))
		move_and_slide()
	
func spawn_pages():
	var page = load("res://Scenes/Pages/Presets/Basic" + str(difficulty) + ".tscn")
	var pageInst = page.instantiate()
	pageInst.position = position
		
	if (good):
		print(pageInst.get_child(3))
		pageInst.get_child(3).rand(true)
	else:
		pageInst.get_child(3).rand(false)
		
	get_parent().add_child(pageInst)

func chosenVal():
	chosen = true
	
func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false

func _ready():
	$Label.set_text(company)
