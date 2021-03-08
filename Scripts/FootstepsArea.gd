extends Action

export(Array, String) var footsteps_sfx_names
onready var area = $Area
var can_play_footsteps = true


func _physics_process(delta):
	check_step()

func check_step() :
	if area.overlaps_body(Player) and Player.isMoving and can_play_footsteps:
		try_to_perform()

func perform() :
	can_play_footsteps = false
	print("Step")
	assert(!footsteps_sfx_names.empty())
	
	var name = footsteps_sfx_names[randi() % footsteps_sfx_names.size()]
	var sfx = MusicPlayer.get_sfx(name)
	var waitTime = sfx.stream.get_length()
	sfx.play()
	yield(get_tree().create_timer(waitTime), "timeout")
	can_play_footsteps = true
	
