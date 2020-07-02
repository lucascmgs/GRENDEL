extends Node2D

onready var dialogBox = $DialogBox

func startDialog(text_list) :
	dialogBox.startDialog(text_list)
