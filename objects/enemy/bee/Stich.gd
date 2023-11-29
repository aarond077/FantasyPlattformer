extends Area2D


@export var damage : int = 10
@export var bee : CharacterBody2D
@export var facing_shape : FacingCollisionShape2D
@export var knockback_speed : float

func _ready():
	monitoring = false
	bee.connect("facing_direction_changed", _on_bee_facing_direction_changed)
	
func _on_bee_facing_direction_changed(facing_right : bool):
	if(facing_right):
		facing_shape.position = facing_shape.facing_right_position
	else:
		facing_shape.position = facing_shape.facing_left_position
	


func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			
			var direction_to_damageable = (body.global_position - get_parent().global_position)
			var direction_sign = sign(direction_to_damageable.x)
			
			if(direction_sign > 0):
				child.hit(damage, Vector2.RIGHT, knockback_speed)
			
			elif(direction_sign < 0):
				child.hit(damage, Vector2.LEFT, knockback_speed)
			else:
				child.hit(damage, Vector2.ZERO, knockback_speed)
