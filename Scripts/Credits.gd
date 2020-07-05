extends Node2D

var children
export var time_between_credits = 8
export var time_to_go_back_to_title = 20
export(String) var title_scene_path

func _ready () :
	Player.visible = false
	children = get_children()
	var number_of_children = get_child_count()

	var displayed_children = 1
	for child in children :
		
		child.visible = true
		yield(get_tree().create_timer(time_between_credits), "timeout")
		if(number_of_children < displayed_children) :
			child.visible = false
		displayed_children += 1
	yield(get_tree().create_timer(time_to_go_back_to_title), "timeout")
	ConditionTrackerSingleton.storedConditions.clear()
	SceneSwitcher.goto_scene(title_scene_path)
