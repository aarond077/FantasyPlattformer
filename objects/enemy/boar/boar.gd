extends CharacterBody2D

class_name Boar

@onready var state_machine : FiniteStateMachine = $FiniteStateMachine
@onready var player : CharacterBody2D = get_parent().find_child("Player")
@onready var sprite : Sprite2D = $Sprite2D
@onready var damageable : Damageable = $Damageable

@export var change_direction = false
@export var speed : float = 130.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")




# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction : Vector2 = Vector2.ZERO
var walk_counter : int = 60

signal facing_direction_changed(facing_right : bool)


func _ready():
	randomize()
	damageable.connect("on_hit", _on_damageable_hit)
	damageable.connect("on_is_dead", _on_damageable_is_dead)

func _process(_delta):
	if state_machine.return_current_state().get_state_name() == "BoarAttack":
		run_attack()
	elif state_machine.return_current_state().get_state_name() == "BoarWalk": 
		walk()
	elif state_machine.return_current_state().get_state_name() == "BoarHit":
		direction = Vector2.ZERO
	else:
		direction = Vector2.ZERO


func walk():
	if(change_direction):
		var chance = randi() % 2
		change_direction = false
		match chance:
			0: 
				direction = Vector2.LEFT #turn left
				sprite.flip_h = false
			1:
				direction = Vector2.RIGHT #turn right
				sprite.flip_h = true 
		
	else:
		if(walk_counter == 0):
			change_direction = true #next frame direction can be changed
			var offset = randi() % 10
			walk_counter = 60 + offset
		else:
			walk_counter -= 1
	
	emit_signal("facing_direction_changed", sprite.flip_h)
		
	
func run_attack():
	
	direction = player.position - position
	if direction.x < 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	
	emit_signal("facing_direction_changed", sprite.flip_h)

		
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = direction.normalized().x * speed 
	move_and_slide()
	
	
func set_speed(value : float):
	speed = value

func _on_damageable_is_dead():
	state_machine.change_state("Dead")

func _on_damageable_hit():
	state_machine.change_state("Hit")
#toDO: fix bugs: slow walk in beginning
