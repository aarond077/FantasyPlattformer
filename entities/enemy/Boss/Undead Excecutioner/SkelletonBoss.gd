extends CharacterBody2D


@onready var player : CharacterBody2D = get_parent().find_child("Player")
@onready var sprite : Sprite2D = $Sprite2D

@export var speed : float = 40.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction : Vector2


func _ready():
	set_physics_process(false)

func _process(_delta):
	direction = player.position - position
	
	if direction.x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
		
func _physics_process(delta):
	velocity = direction.normalized() * speed
	move_and_collide(velocity * delta)
