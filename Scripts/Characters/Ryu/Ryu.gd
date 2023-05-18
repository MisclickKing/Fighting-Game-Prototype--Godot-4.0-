class_name Ryu
extends CharacterBody2D

# Get control variables
@onready var controller_id = get_parent().controller_id
var direction = 'null'

@onready var up_input = "up_%s" % controller_id
var forward_input = 'null'
@onready var down_input = "down_%s" % controller_id
var backward_input = 'null'

@onready var punch_left = get_parent().button1
@onready var punch_right = get_parent().button2
@onready var kick_left = get_parent().button5
@onready var kick_right = get_parent().button6

# Get animations and states
@onready var animation = $Sprite2D/AnimationPlayer
@onready var states = $StateManager

# Attributes 
var health = 2000.00
var forward_speed = 200
var backward_speed = 165


func _ready() -> void:
	states.init(self)
	

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
	get_direction()
	#test_buttons()
	move_and_slide()

func get_direction():
	var sprite_direction = $Sprite2D.scale.x
	
	if sprite_direction < 0:
		direction = 'right'
		forward_input = "right_%s" % controller_id
		backward_input = "left_%s" % controller_id
	elif sprite_direction > 0:
		direction = 'left'
		forward_input = "left_%s" % controller_id
		backward_input = "right_%s" % controller_id
	else:
		pass

func test_buttons():
	if Input.is_action_just_pressed(up_input):
		print("up")
	if Input.is_action_just_pressed(forward_input):
		print("forward")
	if Input.is_action_just_pressed(down_input):
		print("down")
	if Input.is_action_just_pressed(backward_input):
		print("backward")
	if Input.is_action_just_pressed(punch_left):
		print("left punch")
	if Input.is_action_just_pressed(punch_right):
		print("right punch")
	if Input.is_action_just_pressed(kick_left):
		print("left kick")
	if Input.is_action_just_pressed(kick_right):
		print("right kick")

