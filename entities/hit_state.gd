extends State

class_name HitState

@export var hit_knockback_speed : float 
@export var return_state_name : String 
@export var dead_state_name : String = "Dead"

@onready var damageable : Damageable = $"../../Damageable"
@onready var timer : Timer = $Timer
@onready var can_transition : bool = false

func enter():
	super.enter()
	can_transition = false
	timer.start()     
	animation_player.play("hit")
	
func exit(): 
	super.exit()
	can_transition = false
	
func _ready():
	damageable.call_deferred("connect", "on_hit", _on_damageable_hit)
	pass

func _on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2, knockback_speed : float):
	if(damageable.health > 0):
		character.direction = knockback_direction
		hit_knockback_speed = knockback_speed
		#call_deferred("emit_signal", "interrupt_state", "HitState")
		emit_signal("interrupt_state", "HitState")
	else:
		call_deferred("emit_signal", "interrupt_state", "Dead")


func _on_timer_timeout():
	can_transition = true
	
func state_process(delta):
	if damageable.health > 0:
		character.velocity += hit_knockback_speed/5.0 * character.direction
		if can_transition:
			call_deferred("emit_signal", "interrupt_state", return_state_name)
	else:
		call_deferred("emit_signal", "interrupt_state", dead_state_name)

func get_state_name():
	return "HitState"
	


