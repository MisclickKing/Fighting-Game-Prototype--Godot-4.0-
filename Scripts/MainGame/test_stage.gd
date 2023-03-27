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
##                                      Programmer's Note                                      ##
#################################################################################################
# Side note, make the character's name a grabable value when instancing in game for referencing #
#################################################################################################
func flip_character():
	# Controller 1
	$Controller1.get_node("Ryu").get_node("Sprite2D").scale.x = sign(controller1_side)
	$Controller1.get_node("Ryu").get_node("CollisionBox").position.x = sign(controller1_side)
	$Controller1.get_node("Ryu").get_node("HurtBoxes").scale.x = sign(controller1_side)
	$Controller1.get_node("Ryu").get_node("HitBoxes").scale.x = sign(controller1_side)
	# Controller 2
	$Controller2.get_node("Ryu").get_node("Sprite2D").scale.x = sign(controller2_side)
	$Controller2.get_node("Ryu").get_node("CollisionBox").position.x = sign(controller2_side)
	$Controller2.get_node("Ryu").get_node("HurtBoxes").scale.x = sign(controller2_side)
	$Controller2.get_node("Ryu").get_node("HitBoxes").scale.x = sign(controller2_side)
