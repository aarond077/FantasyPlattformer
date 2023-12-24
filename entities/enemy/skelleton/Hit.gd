extends State


@export var knockback_speed : float = 60.0

@onready var timer : Timer = $Timer
@onready var can_transition : bool = false
@export var damageable : Damageable

func enter():
	super.enter()
	can_transition = false
	timer.start()     
	animation_player.play("hit")
	
func _ready():
	damageable.connect("on_hit", _on_damageable_hit)


func _on_damageable_hit(node : Node, damage_amount : int, knockback_direction : Vector2):
	if(damageable.health > 0):
		character.velocity += knockback_speed * knockback_direction
		emit_signal("interrupt_state", "Hit")
	else:
		print("dead")
		emit_signal("interrupt_state", "Dead")


func _on_timer_timeout():
	can_transition = true
	
func transition():
	if can_transition:
		get_parent().change_state("Follow")

func exit():
	can_transition = false

func get_state_name():
	return "SkelletonHit"
	
