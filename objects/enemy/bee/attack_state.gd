extends State

@export var stich : Area2D 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	super.enter()
	stich.monitoring = false
	can_move = false
	animation_player.play("attack")

func state_process(delta):
	character.direction = player.position - character.position + Vector2(0, -18)

func transition():
	if character.direction.length() > 16:
		get_parent().change_state("Follow")

func toggle_stich_monitoring():
	stich.monitoring = not stich.monitoring
	
func get_state_name():
	return "Attack"

