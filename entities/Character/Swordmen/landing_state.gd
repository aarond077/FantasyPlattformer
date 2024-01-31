extends State

class_name PlayerLandingState

@onready var can_transition = false
@onready var landing_animation_name : String = "jump_end"

func enter():
	super.enter()
	#can_move = false
	can_transition = true
	#animation_player.play("jump_end")
	get_parent().change_state("Ground")

func transition():
	pass
		

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == landing_animation_name):
		get_parent().change_state("Ground")

func return_state_name():
	return "Landing"
