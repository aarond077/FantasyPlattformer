extends StateNew

class_name WalkBoar


@onready var idle_timer : Timer = $IdleTimer

func enter():
	super.enter()
	idle_timer.start()
	owner.set_speed(60.0)
	animation_player.play("walk")
	

func get_state_name():
	return "BoarWalk"



func _on_player_detection_body_entered(body):
	if get_parent().current_state is WalkBoar: 
		get_parent().change_state("Attack")


func _on_idle_timer_timeout():
	get_parent().change_state("Idle")
