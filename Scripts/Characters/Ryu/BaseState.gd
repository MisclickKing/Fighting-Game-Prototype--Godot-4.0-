class_name BaseState
extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 0
var speed = 0

enum State {
	Null,
	Idle,
	Crouch,
	Walk,
	JumpUp
}

# Pass in a reference to the CharacterBody2D so that it can be used by the state
var player: Ryu

func enter() -> void:
	pass

func exit() -> void:
	pass

func input(event: InputEvent) -> int:
	return State.Idle

func process(delta: float) -> int:
	return State.Idle

func physics_process(delta: float) -> int:
	return State.Idle
