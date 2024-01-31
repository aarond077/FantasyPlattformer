extends CharacterBody2D

@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var sprite : Sprite2D = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var direction : Vector2 = Vector2.ZERO

signal facing_direction_changed(facing_left : bool)


func _physics_process(delta):
	#debug.text = state_machine.return_current_state().name
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta 
	if state_machine.return_current_state().can_move :
		#velocity.x = direction.normalized().x * 40.0 * delta
		move_and_slide()
		if direction.x != 0 and state_machine.current_state.get_state_name() != "HitState":
			update_facing_direction()


func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false
	
	emit_signal("facing_direction_changed", !sprite.flip_h)
