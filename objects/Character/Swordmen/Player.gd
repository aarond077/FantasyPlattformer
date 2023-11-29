extends CharacterBody2D

class_name Player 

@export var speed : float = 200.0
@export var hit_state : State 

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var damageable : Damageable = $Damageable

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facing_direction_changed(facing_right : bool)

func _ready():
	damageable.connect("on_is_dead", on_damageable_is_dead)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
#	elif state_machine.current_state != hit_state:
#		velocity.x = move_toward(velocity.x, 0, speed)
	
	if direction.x != 0 \
		and state_machine.current_state.get_state_name() != "Dash" \
	
		and state_machine.current_state.get_state_name() != "HitState":			
		velocity.x = direction.x * speed
	elif state_machine.current_state.get_state_name() != "HitState" \
		and state_machine.current_state.get_state_name() != "Dash":
		velocity.x = move_toward(velocity.x, 0, speed)
	if(state_machine.current_state.can_move):
		move_and_slide()
	update_facing_direction()
	



func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !sprite.flip_h)

func on_damageable_is_dead():
	print("just died")
