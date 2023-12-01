extends CharacterBody2D


@export var movement_speed : float 

@export var starting_move_direction : Vector2 = Vector2.LEFT
@export var hit_state : State
@onready var animation_tree : AnimationTree = $AnimationTree

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine




# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.

	# Get the input direction and handle thae movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction : Vector2 = starting_move_direction
	if direction and state_machine.check_if_can_move():
		velocity.x = direction.x * movement_speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, movement_speed)
	

	move_and_slide()
