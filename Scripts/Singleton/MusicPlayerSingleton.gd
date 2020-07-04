extends Node

onready var Songs = $Songs
onready var SFX = $SFX

export var song_name : String

var current_song : AudioStreamPlayer = null

func get_song(song_name) :
	return Songs.get_node(song_name)
	
func get_sfx(sfx_name) :
	return SFX.get_node(sfx_name)

func play(song_name) : 
	var song = get_song(song_name)
	
	if(current_song != null and song.name == current_song.name):
		return
	
	assert(song != null)
	if(current_song != null) :
		current_song.stop()
	current_song = song
	current_song.play()


	
func play_sfx(sfx_name) :
	var sfx = get_sfx(sfx_name)
	assert(sfx != null)
	
	sfx.play()

