extends CharacterBody2D

@onready var dead_state : SkelletonDeadState = $FiniteStateMachine/Dead
@onready var damageable : Damageable = $Damageable
@onready var debug : Label = $debug
@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var sprite : Sprite2D = $Sprite2D
@onready var shield_monitoring = true
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


signal facing_direction_changed(facing_right : bool)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var direction : Vector2 = Vector2.ZERO


func _physics_process(delta):
	#debug.text = state_machine.return_current_state().name
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta 
	if direction != Vector2.ZERO:
		emit_signal("facing_direction_changed", !sprite.flip_h)
	if state_machine.return_current_state().can_move :
		#velocity.x = direction.normalized().x * 40.0 * delta
		move_and_slide()


func _on_player_detection_body_entered(body):
	shield_monitoring = true
	if(not state_machine.return_current_state().get_state_name() == "SkelletonHit" and
		not state_machine.return_current_state().get_state_name() == "SkelletonDead" and \
		state_machine.return_current_state().get_state_name() == "SkelletonIdle" or \
		state_machine.return_current_state().get_state_name() == "SkelletonWalk"):
			state_machine.change_state("Follow") #if player is detected follow player





func _on_attack_detection_body_entered(body):
	if(shield_monitoring and \
	not state_machine.return_current_state().get_state_name() == "SkelletonHit" and
	state_machine.return_current_state().get_state_name() != "SkelletonIdle" and \
	state_machine.return_current_state().get_state_name() != "SkelletonWalk") and \
	not state_machine.return_current_state().get_state_name() == "SkelletonDead":
		state_machine.change_state("Shield")



func _on_attack_detection_body_exited(body):
	if not state_machine.return_current_state().get_state_name() == "SkelletonHit" and \
		not state_machine.return_current_state().get_state_name() == "SkelletonDead":
			state_machine.change_state("Follow")


func _on_player_detection_body_exited(body):
	if state_machine.return_current_state().get_state_name() == "SkelletonHit" and \
		not state_machine.return_current_state().get_state_name() == "SkelletonDead":
			shield_monitoring = false
	#state_machine.change_state("Walk")

