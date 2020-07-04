extends Node


var current_scene = null


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func goto_scene(path) :

	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path) : 
	
	var NewScene = ResourceLoader.load(path)
	
	var scene_temp = NewScene.instance()
	get_tree().get_root().add_child(scene_temp)
	
	get_tree().set_current_scene(scene_temp)


	current_scene.free()
	
	current_scene = scene_temp
