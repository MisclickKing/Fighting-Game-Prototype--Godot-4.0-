extends BaseState

var forward_speed = 200
var backward_speed = 165

func enter() -> void:
	player.velocity.y = 0

func input(event: InputEvent) -> int:
	return State.Null


func physics_process(delta: float) -> int:
	if Input.is_action_just_pressed("up_%s" % player.controller_id):
		return State.JumpUp
	elif Input.is_action_just_pressed("down_%s" % player.controller_id):
		return State.Crouch
	elif Input.is_action_pressed("left_%s" % player.controller_id) and Input.is_action_pressed("right_%s" % player.controller_id) and player.direction == 'left':
		move_left()
	elif Input.is_action_pressed("left_%s" % player.controller_id) and Input.is_action_pressed("right_%s" % player.controller_id) and player.direction == 'right':
		move_right()
	elif Input.is_action_pressed("left_%s" % player.controller_id):
		move_left()
	elif Input.is_action_pressed("right_%s" % player.controller_id):
		move_right()
	else:
		neutral()
		return State.Idle
	
	# Player movement
	player.velocity.x = direction * speed
	
	return State.Null


# Directional values based on input
func move_left():
	direction = -1 
	if player.direction == 'right':
		speed = backward_speed
		player.animation.play("WalkBackward")
	elif player.direction == 'left':
		speed = forward_speed
		player.animation.play("WalkForward")

func move_right():
	direction = 1
	speed = 165
	if player.direction == 'right':
		speed = forward_speed
		player.animation.play("WalkForward")
	elif player.direction == 'left':
		speed = backward_speed
		player.animation.play("WalkBackward")

func neutral():
	direction = 0
