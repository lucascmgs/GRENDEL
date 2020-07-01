extends RichTextLabel


var dialogList = ["First sentence very long for testing purposes", "Second sentence, for testing purposes, of course", "Third- You get it", "Final sentence, the box will close next"]

var page = 0

signal BleepSignal
signal CloseDialogSignal

func _ready():
	set_bbcode(dialogList[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("confirm_text") :
		if get_visible_characters() > get_total_character_count() :
			if page < dialogList.size() - 1 :
				page += 1
				set_bbcode(dialogList[page])
				set_visible_characters(0)
			else :
				emit_signal("CloseDialogSignal")
		else :
			set_visible_characters(get_total_character_count())
			
			
func current_char_is_blank():
	visible_characters = get_visible_characters()
	if dialogList[page][visible_characters-1] != " " :
		return false
	else:
		return true

func _on_DialogTimer_timeout():
	var visible_characters = get_visible_characters()

	if visible_characters <= get_total_character_count() :
		if !current_char_is_blank() :
			emit_signal("BleepSignal")
		set_visible_characters( visible_characters + 1)



func _on_RichTextLabel_draw():
	Player.canMove = false
