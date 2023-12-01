extends CharacterBody2D
class_name bee
@export var movement_speed : float
@onready var rng = RandomNumberGenerator.new()
#@onready var direction : Vector2 = Vector2.ZERO
@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var damageable : Damageable = $Damageable
@onready var direction_locked : bool = false
@onready var sprite : Sprite2D = $Sprite2D
@onready var direction : Vector2
@onready var player : CharacterBody2D = get_parent().find_child("Player")
@onready var debug : Label = $debug

signal facing_direction_changed(facing_right : bool)

signal spawn_limit_changed()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	damageable.connect("on_is_dead", on_damageable_is_dead)
	
func _physics_process(delta):
	debug.text = str(damageable.health)#state_machine.return_current_state().return_state_name()
	# Add the gravity.
#	if not is_on_floor():
#		pass

	# Handle Jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	if(not direction_locked):
#		direction.x = sign(rng.randf_range(-0.5, 0.5))
#		direction.y = sign(rng.randf_range(-0.5, 0.5))
#		direction_locked = true
#
#	if direction and state_machine.check_if_can_move():
#		velocity.x = direction.x * movement_speed
#		velocity.y = direction.y * movement_speed
#	elif state_machine.current_state != hit_state:
#		velocity.x = move_toward(velocity.x, 0, movement_speed)
#	if find_child("Fly").direction.x > 0:
#		sprite.flip_h = true
#	else:
#		sprite.flip_h = false
	emit_signal("facing_direction_changed", sprite.flip_h)
	if state_machine.return_current_state().can_move :
		move_and_slide()

func on_damageable_is_dead():
	if not state_machine.return_current_state().get_state_name() == "Dead":
		emit_signal("spawn_limit_changed")
		print("dead bee")
		state_machine.change_state("Dead")
