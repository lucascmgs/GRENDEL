extends RichTextLabel


export var dialogList : Array

var page = 0

signal BleepSignal
signal CloseDialogSignal

func _ready():
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
				page = 0
				set_visible_characters(0)
				emit_signal("CloseDialogSignal")
		else :
			if get_visible_characters() > 0:
				set_visible_characters(get_total_character_count())
			
			
func current_char_is_blank():
	visible_characters = get_visible_characters()
	if dialogList[page][visible_characters-1] != " " :
		return false
	else:
		return true

func _on_DialogTimer_timeout():

	if visible :
		var visible_characters = get_visible_characters()

		if visible_characters <= get_total_character_count() :
			if !current_char_is_blank() :
				emit_signal("BleepSignal")
			set_visible_characters( visible_characters + 1)



func _on_RichTextLabel_draw():
	Player.canMove = false
