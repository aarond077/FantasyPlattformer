extends Node

class_name Damageable

@onready var debug : Label = $debug
@onready var can_take_damage : bool = true

signal on_hit(node : Node, damage_taken : int, knockback_direction : Vector2, knockback_speed : float)

signal on_is_dead()

@export var max_health : float

@export var health : float  :
	get:
		return health
	set(value):
		health = value
	
func hit(damage : int, knockback_direction : Vector2, knockback_speed : float):
	if can_take_damage:
		health -= damage
		health_changed(health, damage)
		emit_signal("on_hit", self, damage, knockback_direction, knockback_speed)
		if(check_if_dead()):
			if not get_parent() is Player:
				SceneLogic.dead_enemies.append(get_parent().name)
			emit_signal("on_is_dead")
	if damage == 0:
		emit_signal("on_hit", self, damage, knockback_direction, knockback_speed)
			


func check_if_dead():
	return health <= 0.0

func health_changed(health : float, damage : float):
	SignalBus.emit_signal("on_health_changed", get_parent(), (health - damage) - health)
		
