extends Area2D

@export var facing_shape : FacingCollisionShape
@export var boar : Boar

func _ready():
	#monitoring = false
	boar.connect("facing_direction_changed", _on_boar_facing_direction_changed)

func _on_boar_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position

