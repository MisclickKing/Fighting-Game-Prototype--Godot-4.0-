extends BaseState

# Gets the time in frame count since last change in input
@onready var input_timer: int = 0

# Directional input variables
@onready var directional_input = 5
var last_directional_input = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	increase_input_timer(delta)
	get_directional_input()
	input_timer_reset()

# increases input_timer every frame
func increase_input_timer(delta):
	if(input_timer < 99):
		input_timer += (60)*delta
		print(input_timer)
		

func input_timer_reset():
	if (directional_input != last_directional_input):
		input_timer = 0
		last_directional_input = directional_input

func get_directional_input():
	if Input.is_action_pressed("up_%s" % player.controller_id) and Input.is_action_pressed("right_%s" % player.controller_id):
		directional_input = 9
	elif Input.is_action_pressed("left_%s" % player.controller_id) and Input.is_action_pressed("up_%s" % player.controller_id):
		directional_input = 7
	elif Input.is_action_pressed("right_%s" % player.controller_id) and Input.is_action_pressed("down_%s" % player.controller_id):
		directional_input = 3
	elif Input.is_action_pressed("down_%s" % player.controller_id) and Input.is_action_pressed("left_%s" % player.controller_id):
		directional_input = 1
	elif Input.is_action_pressed("up_%s" % player.controller_id):
		directional_input = 8
	elif Input.is_action_pressed("right_%s" % player.controller_id):
		directional_input = 6
	elif Input.is_action_pressed("down_%s" % player.controller_id):
		directional_input = 2
	elif Input.is_action_pressed("left_%s" % player.controller_id):
		directional_input = 4
	else:
		directional_input = 5
	
	#print(directional_input)

