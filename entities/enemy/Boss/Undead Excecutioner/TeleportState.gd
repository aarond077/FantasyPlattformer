extends StateNew

var can_transition: bool = false


func enter():
	super.enter()
	animation_player.play("skill")
	
func do_transition():
	can_transition = true
	
func teleport():
	owner.position = player.position + Vector2.RIGHT * 40

func transition(): 
	if(can_transition):
		get_parent().change_state("Attack")
		can_transition = false
