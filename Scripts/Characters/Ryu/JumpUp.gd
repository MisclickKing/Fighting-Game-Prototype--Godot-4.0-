extends BaseState

var jump_height : float = 65
var jump_time_to_peak : float = 0.40
var jump_time_to_descent : float = 0.35

var jump_force : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0


func get_gravity():
	return jump_gravity if player.velocity.y < 0.0 else fall_gravity


func jump(delta):
	player.velocity.x = 0
	player.velocity.y += get_gravity() * delta
	
	if player.velocity.y < 0.0 and !player.is_on_floor():
		player.animation.play("JumpUpRising")
	elif player.velocity.y >= 0.0 and !player.is_on_floor():
		player.animation.play("JumpUpFalling")

func enter() -> void:
	player.velocity.y = jump_force
	player.velocity.x = 0


func input(event: InputEvent) -> int:
	return State.Null


func physics_process(delta: float) -> int:
	jump(delta)
	
	if player.is_on_floor() and Input.is_action_pressed("up_%s" % player.controller_id):
		return State.JumpUp
	elif player.is_on_floor() and Input.is_action_pressed("down_%s" % player.controller_id):
		return State.Crouch
	elif player.is_on_floor() and Input.is_action_pressed("left_%s" % player.controller_id):
		return State.Walk
	elif player.is_on_floor() and Input.is_action_pressed("right_%s" % player.controller_id):
		return State.Walk
	elif player.is_on_floor() and !Input.is_action_pressed("up_%s" % player.controller_id):
		return State.Idle
	return State.Null




