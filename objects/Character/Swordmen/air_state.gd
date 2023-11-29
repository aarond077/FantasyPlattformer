extends State

class_name Player_Air_State

@export var landing_state : State
@export var double_jump_velocity : float = -300
@export var double_jump_animation : String = "double_jump"
@export var landing_animation : String = "landing"


var has_double_jumped = false

func enter():
	pass
	#animation_player.play("jump_start")

func exit():
	has_double_jumped = false
	
func state_process(delta):
	if(character.is_on_floor()):
		get_parent().change_state("Landing")
#	if owner.direction.x != 0:
#		character.velocity.x = character.direction.x * character.speed
#	else:
#		owner.velocity.x = move_toward(owner.velocity.x, 0, owner.speed)
	owner.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !has_double_jumped):
		double_jump()
	
		

func double_jump():
	character.velocity.y = double_jump_velocity
	animation_player.play(double_jump_animation)
	has_double_jumped = true
	
func get_state_name():
	return "Air"
