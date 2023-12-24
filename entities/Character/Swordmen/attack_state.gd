extends State

class_name PlayerAttackState

@export var attack2_node : String = "attack2"
@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"
@export var attack_air1_name : String = "attack_air_side1"
@export var attack_air2_name : String = "attack_air_side2"
@export var attack_air_node : String = "attack_air_side2"

@onready var air_state : State = $"../Air"
@onready var sword_sound2 : AudioStreamPlayer = $"../../SoundEffects/Sword/SwipeSound2"
@onready var attack_air_sound2 : AudioStreamPlayer = $"../../SoundEffects/Sword/SwipeAirSound2"

@onready var timer : Timer = $Timer
#func enter():
#	timer.start()

func enter():
	can_move = false

func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()

func _on_animation_player_animation_finished(anim_name):
	if(anim_name == attack1_name):
		if(timer.is_stopped()):
			emit_signal("interrupt_state", "Ground")
		else:
			sword_sound2.play()
			animation_player.play(attack2_node)
	if(anim_name == attack2_name):
		emit_signal("interrupt_state", "Ground")
		
	

func get_state_name():
	return "Attack"
