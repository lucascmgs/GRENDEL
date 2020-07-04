extends Action

export var song_name : String

func perform() :
	MusicPlayer.play(song_name)


