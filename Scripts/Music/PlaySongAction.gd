extends Action

export var song_name : String

export var play_on_ready = true

func _ready():
	if(play_on_ready):
		interact()


func interact() :
	MusicPlayer.play(song_name)


