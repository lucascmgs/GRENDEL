extends RichTextLabel


var dialogList = ["First sentence", "Second sentence", "Third- You get it", "End"]

var page = 0
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
			set_visible_characters(get_total_character_count())

func _on_DialogTimer_timeout():
	set_visible_characters(get_visible_characters() + 1)
