extends State

@onready var can_transition : bool = false
@onready var timer : Timer = $Timer

@export var damageable : Damageable

# Called when the node enters the scene tree for the first time.
func enter():
	print("idle")
	super.enter()
	can_move = false
	timer.start()
	can_transition = false
	animation_player.play("idle")
	
func exit():
	super.exit()
	can_transition = false
	
	

func transition():
	super.transition()
	if can_transition:
		call_deferred("emit_signal", "interrupt_state", "Attack")

func get_state_name():
	return "Idle"


func _on_timer_timeout():
	call_deferred("emit_signal", "interrupt_state", "Walk")


func _on_player_detection_body_entered(body):
	print("detected_idle")
	if damageable.health > 0:
		can_transition = true
	
