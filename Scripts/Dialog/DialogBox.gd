extends NinePatchRect

onready var audioStream = $DialogBleep
onready var timer = $DialogTimer
onready var textLabel = $RichTextLabel

func startDialog(textList):
	visible = true
	textLabel.dialogList = textList
	textLabel.set_bbcode(textList[0])
	timer.start()

func _on_RichTextLabel_BleepSignal():
	audioStream.play()

func _on_RichTextLabel_CloseDialogSignal():
	Player.canMove = true
	timer.stop()
	visible = false
	emit_signal("dialogCompleted")
