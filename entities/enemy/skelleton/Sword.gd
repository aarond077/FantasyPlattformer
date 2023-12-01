extends Area2D


@onready var polygon : CollisionPolygon2D = $CollisionPolygon2D
@export var character : CharacterBody2D
@export var damage = 15
@export var knockback_speed : float = 100.0

func _ready():
	character.connect("facing_direction_changed", _on_sword_facing_direction_changed)

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
				
func _on_sword_facing_direction_changed(facing_right : bool):
	if(facing_right):
		polygon.scale.x = 1
	else:
		polygon.scale.x = - 1
	
func toggle_sword_detection():
	monitoring = !monitoring

func monitoring_off():
	monitoring = false
