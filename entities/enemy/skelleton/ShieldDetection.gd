extends Area2D


@onready var facing_shape = $FacingCollisionShape
@export var character : CharacterBody2D
@export var knockback_speed : float = 100.0
func _ready():
	character.connect("facing_direction_changed", _on_shield_facing_direction_changed)

func _on_shield_facing_direction_changed(facing_right : bool):
	if(!facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
