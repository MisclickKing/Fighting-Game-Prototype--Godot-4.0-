extends BaseState


##                                      Programmer's Note                                      ##
#################################################################################################
#  The current walk/movement system is simple, and doesn't account for side switching based     #
#  on oppentent's location relative to the player (yet). Once more basic functions are in       #
#  place and funcitoning, this code will need to be reworked to account for which side the      #
#  player is facing. This also leads further into having to change system input controls into   #
#  variables that signal off like regular inputs, with the added benefit of input swapping      #
#################################################################################################


func enter() -> void:
	print("Walk")
	
	player.velocity.y = 0

func input(event: InputEvent) -> int:
	return State.Null
	


func physics_process(delta: float) -> int:
	if Input.is_action_just_pressed("up_%s" % player.controller_id):
		return State.JumpUp
	elif Input.is_action_just_pressed("down_%s" % player.controller_id):
		return State.Crouch
	elif Input.is_action_pressed("left_%s" % player.controller_id) and Input.is_action_pressed("right_%s" % player.controller_id):
		move_left()
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
	speed = 200
	player.animation.play("WalkForward")

func move_right():
	direction = 1
	speed = 165
	player.animation.play("WalkBackward")

func neutral():
	direction = 0
