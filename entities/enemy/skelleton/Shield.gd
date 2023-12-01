extends State
@export var speed : float = 20.0

@export var damageable : Damageable 

# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	damageable.can_take_damage = false
	can_move = false
	animation_player.play("shield")

func state_process(delta):
	character.direction = player.position - character.position
	if character.direction.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	pass

func exit():
	damageable.can_take_damage = true
	
func get_state_name():
	return "SkelletonShield"

func _on_shield_body_entered(body):
	damageable.can_take_damage = false


func _on_shield_body_exited(body):
	damageable.can_take_damage = true
