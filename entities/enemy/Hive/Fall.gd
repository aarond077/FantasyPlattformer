extends State
class_name HiveFallState

@onready var damageable : Damageable = $"../../Damageable"
# Called when the node enters the scene tree for the first time.
func _ready():
	damageable.call_deferred("connect", "on_hit", _on_damageable_hit)

func _on_damageable_hit(node : Node, damage_taken : int, knockback_direction : Vector2):
	call_deferred("emit_signal", "interrupt_state", "Fall")


func enter():
	super.enter()
	animation_player.play("fall")
	can_move = true

func exit():
	super.enter()
	can_move = false
	
func get_state_name():
	return "Fall"

