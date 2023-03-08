extends Node


@onready var states = {
	BaseState.State.Idle : $Idle,
	BaseState.State.Walk : $Walk,
	BaseState.State.Crouch : $Crouch,
	BaseState.State.JumpUp : $JumpUp,
}

var current_state: BaseState

func change_state(new_state: int) -> void:
	if current_state:
		current_state.exit()
	
	current_state = states[new_state]
	current_state.enter()


func init(player: Ryu) -> void:
	for child in get_children():
		child.player = player
	
	# Initialize with a default state of idle
	change_state(BaseState.State.Idle)


func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state != BaseState.State.Null:
		change_state(new_state)


func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state != BaseState.State.Null:
		change_state(new_state)
