extends Node2D


export(Array, String) var conditions_to_not_exist

func _ready():
	for condition in conditions_to_not_exist :
		if (not condition in ConditionTrackerSingleton.storedConditions):
			return
	erase_existence()


func erase_existence():
	print("apagou")
	queue_free()
	#visible = false
