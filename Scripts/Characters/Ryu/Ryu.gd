class_name Ryu
extends CharacterBody2D

@onready var controller_id = get_parent().controller_id
@onready var animation = $Sprite2D/AnimationPlayer
@onready var states = $StateManager

func _ready() -> void:
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
	move_and_slide()
