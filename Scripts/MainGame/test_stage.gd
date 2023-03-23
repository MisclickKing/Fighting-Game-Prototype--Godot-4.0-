extends Node

var controller1_location
var controller2_location
var controller1_side
var controller2_side


# Called when the node enters the scene tree for the first time.
func _ready():
	face_opponent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	face_opponent()




# ---------------------------------- #
#  Makes the players face each other #
# ---------------------------------- #
func face_opponent():
	get_controller_character_location()
	get_controller_character_distance()
	flip_character()

# Gets gobal x cordinates from the players
func get_controller_character_location():
	controller1_location = $Controller1/Ryu.global_position.x
	controller2_location = $Controller2/Ryu.global_position.x

# Calculates the distance of x between the players
func get_controller_character_distance():
	controller1_side = controller1_location - controller2_location
	controller2_side = controller2_location - controller1_location

# Based on sign value of distance, flip sprite
func flip_character():
	if controller1_side < controller2_side:
		$Controller1.get_node("Ryu").scale.x = -1
		$Controller2.get_node("Ryu").scale.x = 1
	elif controller1_side > controller2_side:
		$Controller1.get_node("Ryu").scale.x = 1
		$Controller2.get_node("Ryu").scale.x = -1
	else:
		pass
