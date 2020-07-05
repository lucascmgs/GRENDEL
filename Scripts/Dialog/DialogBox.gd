extends NinePatchRect


onready var timer = $DialogTimer
onready var textLabel = $RichTextLabel

func startDialog(textList):
	visible = true
	textLabel.dialogList = textList
	textLabel.set_bbcode(textList[0])
	timer.start()
	
func startDialogBeforeScene(textList, pathToScene) :
	textLabel.scene_to_load_after = pathToScene
	startDialog(textList)

func _on_RichTextLabel_BleepSignal():
	MusicPlayer.play_sfx("DialogBleep")

func _on_RichTextLabel_CloseDialogSignal():
	Player.canMove = true
	timer.stop()
	visible = false
	emit_signal("dialogCompleted")
