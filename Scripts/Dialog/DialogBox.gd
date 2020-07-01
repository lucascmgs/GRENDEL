extends NinePatchRect



onready var audioStream = $DialogBleep


func _on_RichTextLabel_BleepSignal():

	audioStream.play()


func _on_RichTextLabel_CloseDialogSignal():
	Player.canMove = true
	visible = false
