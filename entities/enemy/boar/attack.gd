extends State

@onready var can_transition : bool = false
@onready var speed : float = 120.0

@export var damageable : Damageable
@export var snout : Weapon 
func enter():
	super.enter()
	snout.monitoring = true
	can_transition = false
	animation_player.play("run")
	
func exit():
	super.exit()
	snout.monitoring = false
	can_transition = false


func state_process(delta):
	character.direction.x = player.position.x - character.position.x #- 140
	character.velocity.x = character.direction.normalized().x * speed
	
	if owner.direction.length() > 160 or player.get_health() <= 0: 
		call_deferred("emit_signal","interrupt_state", "Idle")

func get_state_name():
	return "Attack"
