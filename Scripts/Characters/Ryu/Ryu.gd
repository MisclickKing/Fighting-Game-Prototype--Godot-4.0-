class_name Ryu
extends CharacterBody2D

# Get control variables
@onready var controller_id = get_parent().controller_id
var direction = 'null'

# Get animations and states
@onready var animation = $Sprite2D/AnimationPlayer
@onready var states = $StateManager

# Attributes 
var health = 2000.00


func _ready() -> void:
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
	get_direction()
	move_and_slide()

func get_direction():
	var sprite_direction = $Sprite2D.scale.x
	
	if sprite_direction < 0:
		direction = 'right'
	elif sprite_direction > 0:
		direction = 'left'
	else:
		pass



