extends Action
class_name DialogAction

export var dialog_name : String


func perform() :
	
	var dialog = DialogSingleton.texts[dialog_name]

	DialogSingleton.startDialog(dialog)


