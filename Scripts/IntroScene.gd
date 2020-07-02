extends Node2D

onready var introSounds = $IntroSounds
export var firstScene : String

# Called when the node enters the scene tree for the first time.
func _ready():
	Player.visible = false
	introSounds.play()


func _on_IntroSounds_finished():
	Player.visible = true
	SceneSwitcher.goto_scene(firstScene)
