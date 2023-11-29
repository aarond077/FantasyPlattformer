extends State

var can_transition : bool 

@onready var timer : Timer = $Timer

func enter():
	super.enter()
	can_transition = false
	can_move = false
	timer.start()
	animation_player.play("Idle")
	
func transition():
	super.transition()
	if can_transition:
		get_parent().change_state("Walk")

func get_state_name():
	return "SkelletonIdle"

func _on_timer_timeout():
	can_transition = true
