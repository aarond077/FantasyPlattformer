extends State

class_name PlayerAttackState

@export var attack2_node : String = "attack2"
@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"

@onready var timer : Timer = $Timer
#func enter():
#	timer.start()

func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == attack1_name):
		if(timer.is_stopped()):
			get_parent().change_state("Ground")
		else:
			animation_player.play(attack2_node)
	if(anim_name == attack2_name):
		get_parent().change_state("Ground")

func get_state_name():
	return "Attack"
