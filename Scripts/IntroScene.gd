extends Node2D

onready var introSounds = $IntroSounds
export var firstScene : String

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.visible = false
	var song = MusicPlayer.get_song("Intro")
	
	MusicPlayer.play("Intro")
	var waitTime = song.stream.get_length()
	yield(get_tree().create_timer(waitTime), "timeout")
	leave_intro()


func leave_intro():
	Player.visible = true
	SceneSwitcher.goto_scene(firstScene)
