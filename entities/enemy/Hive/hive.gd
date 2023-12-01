extends CharacterBody2D

class_name Hive

@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var debug : Label = $debug

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	debug.text = state_machine.current_state.get_state_name()
	if state_machine.current_state.can_move:
		velocity.y += gravity * delta
		move_and_slide()
