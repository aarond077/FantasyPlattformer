extends State

var speed = 80.0
# Called when the node enters the scene tree for the first time.
func _ready():
	character.direction = player.position - character.position #+ Vector2(-40, -55)

func state_process(delta):
	change_facing_direction()
	character.direction = player.position - character.position + Vector2(0, -18)
	character.velocity = character.direction.normalized() * speed
# Called every frame. 'delta' is the elapsed time since the previous frame.

func enter():
	super.enter()
	can_move = true
	animation_player.play("fly")
	
func transition():
	if owner.direction.length() < 16: 
		call_deferred("emit_signal", "interrupt_state", "Attack")
	if owner.direction.length() > 250: 
		call_deferred("emit_signal", "interrupt_state", "Fly") #todo: change into fly state after aggro is done
	
func get_state_name():
	return "Follow"
