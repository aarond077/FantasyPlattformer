extends State

class_name HitState

@export var knockback_speed : float 
@export var dead_state : State
@export var return_state_name : String 

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

func _on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	if(damageable.health > 0):
		character.velocity += knockback_speed * knockback_direction
		#call_deferred("emit_signal", "interrupt_state", "HitState")
		emit_signal("interrupt_state", "HitState")
	else:
		call_deferred("emit_signal", "interrupt_state", "Dead")


func _on_timer_timeout():
	can_transition = true
	
func transition():
	super.transition()
	if can_transition:
		call_deferred("emit_signal", "interrupt_state", return_state_name)

func get_state_name():
	return "HitState"
	
