extends State
@export var speed : float
var counter : int = 0
var direction_logical_length : int
# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	animation_player.play("walk")
	can_move = true
	counter = 0

func state_process(delta):
	
	if counter % 100 == 0:
		character.direction = player.position - character.position
	
	if character.direction.x < 0:
		sprite.flip_h = true
	else :
		sprite.flip_h = false
	
	character.velocity.x = character.direction.normalized().x * speed
	counter = counter + 1

func transition():
	super.transition()
	direction_logical_length = character.direction.length()
	if direction_logical_length < 60 and direction_logical_length != 1:
		get_parent().change_state("Attack")
	elif direction_logical_length > 200:
		get_parent().change_state("Walk")

func get_state_name():
	return "SkelletonFollow"


