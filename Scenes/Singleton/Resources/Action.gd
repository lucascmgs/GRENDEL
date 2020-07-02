extends Node


class_name Action

signal finished()

func interact() :
	print("This method should be overriden in " + name + "!")
	emit_signal("finished")
