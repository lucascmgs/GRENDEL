extends KinematicBody2D

var velocity = Vector2.ZERO

const MAX_SPEED = 100


var isH = false
var isV = false


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	if not isV :
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if input_vector.x != 0 :
		isH = true
	else :
		isH = false
	
	
	if not isH :
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up");
	if input_vector.y != 0 :
		isV = true
	else :
		isV = false
	
	
	velocity = input_vector
	
	velocity = move_and_slide(velocity * MAX_SPEED)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
