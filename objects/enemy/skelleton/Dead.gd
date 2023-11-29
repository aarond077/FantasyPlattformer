extends State

class_name SkelletonDeadState

func enter():
	super.enter()
	can_move = false
	animation_player.play("dead")
	
func get_state_name():
	return "SkelletonDead"
