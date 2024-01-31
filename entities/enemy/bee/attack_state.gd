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
	
func exit():
	stich.monitoring = false

func state_process(delta):
	character.direction = player.position - character.position + Vector2(0, -18)
	
	if character.direction.length() > 16:
		call_deferred("emit_signal", "interrupt_state", "Follow")
	if player.get_health() <= 0:
		call_deferred("emit_signal", "interrupt_state", "Fly")
	

func toggle_stich_monitoring():
	stich.monitoring = not stich.monitoring
	
func get_state_name():
	return "Attack"

