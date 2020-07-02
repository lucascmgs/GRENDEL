extends Node2D

export var target_scene = ""
export var new_player_position = Vector2.ZERO



func _on_ChangeArea_body_entered(body):
	if body.name == "Player" :
		Player.position = new_player_position
		SceneSwitcher.goto_scene(target_scene)
