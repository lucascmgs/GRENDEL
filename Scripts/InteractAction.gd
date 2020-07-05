extends Action

export var dialog_name : String
onready var area = $Area

func _input(event):
	if event.is_action_pressed("interact"):
		if area.overlaps_body(Player) and not DialogSingleton.is_displaying:
			try_to_perform()


func perform() :
	assert(!dialog_name.empty())
	var dialog = DialogSingleton.texts[dialog_name]
	DialogSingleton.startDialog(dialog)
