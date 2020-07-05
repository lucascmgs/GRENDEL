extends Action
class_name DialogBeforeSceneAction

export(String) var dialog_name
export(String) var path_to_next_scene

func perform() :
	
	var dialog = DialogSingleton.texts[dialog_name]

	DialogSingleton.startDialogBeforeScene(dialog, path_to_next_scene)

