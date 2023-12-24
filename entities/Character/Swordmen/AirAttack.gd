extends State

@export var attack_air1_name : String = "attack_air_side1"
@export var attack_air2_name : String = "attack_air_side2"
@export var attack_air_node : String = "attack_air_side2"

@onready var air_state : State = $"../Air"
@onready var attack_air_sound2 : AudioStreamPlayer = $"../../SoundEffects/Sword/SwipeAirSound2"

@onready var timer : Timer = $Timer

func enter():
	character.velocity.y = 0# move_toward(character.velocity.y, 0, character.speed)
	character.gravity = 50.5
	
func exit():
	character.gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func state_process(delta):
	character.velocity.y += character.gravity * delta
	if(character.is_on_floor()):
		emit_signal("interrupt_state", "Ground")
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == attack_air1_name):
		if(timer.is_stopped()):
			emit_signal("interrupt_state", "Air")
		else:
			attack_air_sound2.play()
			animation_player.play("attack_air_side2")
	if(anim_name == attack_air2_name):
		emit_signal("interrupt_state", "Air")

func get_state_name():
	return "AirAttack"
