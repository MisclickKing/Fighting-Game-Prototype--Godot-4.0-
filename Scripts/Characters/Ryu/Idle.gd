extends BaseState


func enter() -> void:
	print("Idle")
	
	player.velocity.y = 0
	player.velocity.x = 0
	


func input(event: InputEvent) -> int:
	if Input.is_action_pressed("left_%s" % player.controller_id) or Input.is_action_pressed("right_%s" % player.controller_id):
		return State.Walk
	elif Input.is_action_pressed("down_%s" % player.controller_id):
		return State.Crouch
	elif Input.is_action_pressed("up_%s" % player.controller_id):
		return State.JumpUp
	return State.Null

func physics_process(delta: float) -> int:
	player.animation.play("Idle")
	return State.Null
