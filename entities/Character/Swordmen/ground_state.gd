extends State

class_name PlayerGroundState

@onready var buffer_timer : Timer = $BufferTimer
@onready var dash_timer : Timer = $DashTimer
@onready var jump_velocity : float = -300.0
@onready var can_transition : bool = false
@onready var can_dash : bool = true
@onready var dash_state : PlayerDashState = $"../Dash"
@onready var state_machine : FiniteStateMachine = $".."
@onready var has_jumped : bool = false
@onready var air_state : State = $"../Air"
# Called when the node enters the scene tree for the first time.



func enter():
	has_jumped = false
	air_state.call_deferred("set_has_air_attacked", false)
	pass

func state_process(delta):
	
	if(!character.is_on_floor() and buffer_timer.is_stopped()):
		if(not has_jumped):
			animation_player.play("jump_middle")
		call_deferred("emit_signal", "interrupt_state", "Air")
	elif owner.direction.x == 0 and owner.is_on_floor():
		animation_player.play("idle")
		#owner.velocity.x = move_toward(owner.velocity.x, 0, owner.speed)
	elif not owner.direction.x == 0 and owner.is_on_floor():
		animation_player.play("run")

	owner.direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
func state_input(event : InputEvent):
	if character.is_on_floor():
		if(event.is_action_pressed("jump")):
			jump()
		elif(event.is_action_pressed("attack")):
			attack()
		elif(event.is_action_pressed("stomp")):
			stomp()
		elif(event.is_action_pressed("move_down")):
			character.position.y += 1
			
		if(can_dash):
			get_dash_direction(event)
			
#	if(Input.is_action_just_pressed("move_right") 
#		or Input.is_action_just_pressed("move_left") 
#		and not dash_timer.is_stopped()):
#			dash()
#	elif(Input.is_action_just_pressed("move_right")
#		or Input.is_action_just_pressed("move_left")):
#			dash_timer.start()
			
		
func jump():
	animation_player.play("jump_start")
	has_jumped = true
	character.velocity.y = jump_velocity


func attack():
	animation_player.play("attack1")
	get_parent().change_state("Attack")
	
func stomp():
	get_parent().change_state("Stomp")

func get_dash_direction(event : InputEvent):
	if Input.is_action_pressed("shift"):
		if owner.direction.x > 0:
			dash(Vector2.RIGHT)
		elif owner.direction.x < 0:
			dash(Vector2.LEFT)
	
func dash(dash_direction : Vector2):
	can_dash = false
	dash_timer.start()
	dash_state.dash_direction = dash_direction
	emit_signal("interrupt_state", "Dash")

func get_state_name():
	return "Ground"


func _on_dash_timer_timeout():
	can_dash = true
	
	
