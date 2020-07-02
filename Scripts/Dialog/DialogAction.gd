extends Action
class_name DialogAction

export var dialog_name : String

func _ready() :
	interact()

func interact() :
	var dialog = DialogTextDictionary.texts[dialog_name]

	DialogSingleton.startDialog(dialog)
	emit_signal("finished")

