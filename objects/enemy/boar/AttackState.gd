extends StateNew

@onready var can_transition : bool = false

func enter():
	super.enter() 
	can_transition = false
	owner.set_speed(130.0)
	animation_player.play("run")
	
	
func _process(delta):
	pass

func get_state_name():
	return "BoarAttack"


func _on_player_detection_body_exited(body):
	can_transition = true
	
func transition():
	if can_transition:
		get_parent().change_state("Walk")

