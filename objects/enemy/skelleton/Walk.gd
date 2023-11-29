extends State

@onready var can_turn : bool = false
@export var speed : float = 50.0

# Called when the node enters the scene tree for the first time.
func enter(): 
	super.enter()
	can_turn = false
	if(character.direction == Vector2.ZERO):
		character.direction = Vector2.RIGHT
	animation_player.play("walk")
	
	
func state_process(delta):
	speed = 40.0
	if(can_turn):
		can_turn = false
		if owner.direction == Vector2.RIGHT:
			character.direction = Vector2.LEFT
			sprite.flip_h = true
		else:
			owner.direction = Vector2.RIGHT
			sprite.flip_h = false
	character.velocity.x = character.direction.normalized().x * speed

func get_state_name():
	return "SkelletonWalk"

func _on_fall_detection_body_exited(body):
	can_turn = true
