extends Label

onready var space = $PressSpace

func _input(event):
	if event.is_action_pressed("ui_right"):
		self.text = "< English"
		space.text = "Press space" 
		DialogSingleton.set_language("Inglês")
	elif event.is_action_pressed("ui_left"):
		self.text = "Português >"
		space.text = "Aperte espaço" 
		DialogSingleton.set_language("Português")
