extends Label

func set_child_text(str):
	$Label.text = str(str)
	
func set_value(color):
	$Label.add_theme_color_override("font_color", color)
