extends Node2D

export(String) var intro_scene_path


func _ready():
	Player.visible = false
	
func _input(event):
	if event.is_action_pressed("interact"):
		SceneSwitcher.goto_scene(intro_scene_path)
