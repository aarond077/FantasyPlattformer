extends CharacterBody2D

class_name Player 

@export var speed : float = 200.0
@export var hit_state : State 
@onready var camera_node : Camera2D = $"../Camera2D"

@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = $AnimationTree
@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var damageable : Damageable = $Damageable
@onready var health_bar : Control = $health_bar


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO
var password = "123456"

signal facing_direction_changed(facing_right : bool)

# Node is destroyed
func _exit_tree() -> void:
	SaveLoadModule.clear()

func _ready():
	
	SignalBus.call_deferred("connect", "player_interaction_state", on_player_interaction_state)#interaction
	
	damageable.connect("on_is_dead", on_damageable_is_dead)
	
func _process(delta):
	camera_node.set_deferred("position", position)

func _physics_process(delta):
	# Add the gravity.
#	elif state_machine.current_state != hit_state:
#		velocity.x = move_toward(velocity.x, 0, speed)
	
	if direction.x != 0 \
		and state_machine.current_state.get_state_name() != "Dash" \
		
		and state_machine.current_state.get_state_name() != "Stomp" \
		
		and state_machine.current_state.get_state_name() != "AirAttack" \
	
		and state_machine.current_state.get_state_name() != "HitState":			
		velocity.x = direction.x * speed
	elif state_machine.current_state.get_state_name() != "HitState" \
		and state_machine.current_state.get_state_name() != "Dash":
		velocity.x = move_toward(velocity.x, 0, speed)
	if(state_machine.current_state.can_move):
		if not is_on_floor():
			velocity.y += gravity * delta
		move_and_slide()
	update_facing_direction()
	

func get_health():
	return damageable.health


func update_facing_direction():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", !sprite.flip_h)
	


func on_damageable_is_dead():
	print("just died")
	
func on_player_interaction_state(player_state : String):
	print(player_state)
	state_machine.change_state(player_state)
	
	
