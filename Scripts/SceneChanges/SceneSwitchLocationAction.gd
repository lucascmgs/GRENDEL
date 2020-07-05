extends Action

export var target_scene = ""
export var new_player_position = Vector2.ZERO
export var sfx_name : String


func _on_ChangeArea_body_entered(body):
	if body.name == "Player" :

		print("body entered on " + name)
		try_to_perform()


func perform() :
	
	if(!sfx_name.empty()) :
		Player.canMove = false
		var sfx = MusicPlayer.get_sfx(sfx_name)
		var waitTime = sfx.stream.get_length()
		sfx.play()
		yield(get_tree().create_timer(waitTime), "timeout")
		Player.canMove = true

	Player.position = new_player_position
	SceneSwitcher.goto_scene(target_scene)
