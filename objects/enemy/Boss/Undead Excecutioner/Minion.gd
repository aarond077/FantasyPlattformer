extends CharacterBody2D

@onready var player = get_parent().find_child("Player")
@onready var animation_player : AnimationPlayer = $AnimationPlayer

@export var speed : float = 40.0

func do_idle():
	animation_player.play("idle")

func _physics_process(delta):
	var direction = player.position - position
	velocity = direction.normalized() * speed
	
	move_and_slide()
	
func take_damage():
	queue_free()
