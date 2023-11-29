extends Node

@export var character : CharacterBody2D 

var direction : float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = player.position - character.position
	character.velocity = direction.normalized() * speed
	move_and_collide(velocity * delta)
