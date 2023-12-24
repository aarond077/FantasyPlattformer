extends State

class_name PlayerAirState

@export var landing_state : State
@export var double_jump_velocity : float = -300
@export var double_jump_animation : String = "double_jump"
@export var landing_animation : String = "landing"

@onready var attack_air_sound1 : AudioStreamPlayer = $"../../SoundEffects/Sword/SwipeAirSound1"
@onready var double_jump_sound1 : AudioStreamPlayer = $"../../SoundEffects/Jump/DoubleJumpSound"
# Called when the node enters the scene tree for the first time.


var has_double_jumped = false
var has_air_attacked = false

func ready():
	SignalBus.call_deferred("connect", "wallslide_start", on_signal_bus_wallslide_start)
	SignalBus.call_deferred("connect", "wallslide_end", on_signal_bus_wallslide_end)

func enter():
	has_double_jumped = false
	if(has_air_attacked):
		animation_player.play("jump_middle")
	#animation_player.play("jump_start")

func exit():
	pass#has_double_jumped = false
	
func state_process(delta):
	if(character.is_on_floor()):
		get_parent().change_state("Landing")
#	if owner.direction.x != 0:
#		character.velocity.x = character.direction.x * character.speed
#	else:
#		owner.velocity.x = move_toward(owner.velocity.x, 0, owner.speed)
	owner.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && 
	not has_double_jumped && 
	not has_air_attacked):
		double_jump()
	elif(event.is_action_pressed("attack") &&
	not has_air_attacked):
		air_attack()
	

func air_attack():
		has_air_attacked = true
		attack_air_sound1.play()
		animation_player.play("attack_air_side1")
		call_deferred("emit_signal", "interrupt_state", "AirAttack")
		

func double_jump():
	has_double_jumped = true
	double_jump_sound1.play()
	character.velocity.y = double_jump_velocity
	animation_player.play(double_jump_animation)
	
func set_has_air_attacked(value : bool):
	has_air_attacked = value
	
func get_state_name():
	return "Air"
	
func on_signal_bus_wallslide_start():
	print("wallsi")
	
func on_signal_bus_wallslide_end():
	pass
