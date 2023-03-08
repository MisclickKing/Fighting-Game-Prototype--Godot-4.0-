extends BaseState

func enter() -> void:
	print("Crouch")
	
	player.animation.play("EnterCrouch")
	player.velocity.y = 0
	player.velocity.x = 0
	

func input(event: InputEvent) -> int:
	return State.Null

func physics_process(delta: float) -> int:
	if Input.is_action_pressed("left_%s" % player.controller_id) or Input.is_action_pressed("right_%s" % player.controller_id):
		if Input.is_action_just_released("down_%s" % player.controller_id):
			return State.Walk
	elif Input.is_action_pressed("up_%s" % player.controller_id) and Input.is_action_pressed("down_%s" % player.controller_id):
		return State.JumpUp
	elif Input.is_action_just_released("down_%s" % player.controller_id):
		player.animation.play("ExitCrouch")
		return State.Idle
	return State.Null
