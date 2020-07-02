extends Node

onready var currentStream : AudioStreamPlayer

onready var Songs = $Songs

export var song_name : String


func play(song_name) : 
	var song = Songs.get_node(song_name)
	assert(song != null)
	song.play()
	print(song)

