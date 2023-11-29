extends Area2D
class_name FallDetection

@export var character : CharacterBody2D
@export var facing_shape : FacingCollisionShape

func _ready():
	character.connect("facing_direction_changed", _on_fall_detection_facing_direction_changed)
	
func _on_fall_detection_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
	

