extends Node

class_name Action

export var exectuteOnReady = false
export var oneShot = false

export(Array, String) var conditions_to_happen
export(Array, String) var conditions_not_to_happen
export(Array, String) var alternative_messages
export(String) var resulting_condition

signal finished()

func _ready() :

	if oneShot :
		if resulting_condition.empty() :
			resulting_condition = name
		conditions_not_to_happen.resize(conditions_not_to_happen.size() * 2)
		conditions_not_to_happen.push_front(resulting_condition)
		print(conditions_not_to_happen)
		pass
	if exectuteOnReady :
		try_to_perform()


func try_to_perform() :
	for condition in conditions_to_happen :
		if not condition in ConditionTrackerSingleton.storedConditions :
			display_message_and_quit()
			return
	
	for condition2 in conditions_not_to_happen :
		if ConditionTrackerSingleton.storedConditions.has(condition2) :
			print(condition2)
			display_message_and_quit()
			return
	ConditionTrackerSingleton.storedConditions[resulting_condition] = true
	perform()
	
	
func display_message_and_quit() :
	if(not alternative_messages.empty()) :
		DialogSingleton.startDialog(alternative_messages)

func perform() :
	print("This method should be overriden in " + name + "!")
	emit_signal("finished")
