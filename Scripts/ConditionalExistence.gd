extends Node2D

export(Array, String) var conditions_to_exist
export(Array, String) var conditions_to_not_exist
export(String) var scene_path

func _ready():
	for condition in conditions_to_not_exist :
		if (condition in ConditionTrackerSingleton.storedConditions):
			return
	for condition in conditions_to_exist:
		if(not condition in ConditionTrackerSingleton.storedConditions) :
			return
	spawn()


func spawn():
	var objectScene = load(scene_path)
	var newObject = objectScene.instance()

	add_child(newObject)
	
	
