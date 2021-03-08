extends KinematicBody2D

var velocity = Vector2.ZERO

const MAX_SPEED = 70



export var initial_position = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")


var canMove = true
var isMoving = false

var isV = false
var isH = false


func _ready():
	position = initial_position



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
	
	if canMove :
		if input_vector != Vector2.ZERO :
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Run/blend_position", input_vector)
			animationState.travel("Run")
			isMoving = true
		else :
			animationState.travel("Idle")
			isMoving = false
	
	
		velocity = input_vector
		velocity = move_and_slide(velocity * MAX_SPEED)
	else :
		animationState.travel("Idle")
		isMoving = false
	
