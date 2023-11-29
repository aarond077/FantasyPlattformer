extends State

@export var bee_node : PackedScene
@onready var burst_detection : Area2D = $"../../BurstDetection"
@onready var spawner : Spawner = $"../../Spawner"

# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	can_move = false
	burst_detection.monitoring = false
	animation_player.play("burst")
	
func spawn_bee():
	var bee = bee_node.instantiate()
	bee.position = owner.position + Vector2(20, 0)
	spawner.call_deferred("emit_signal", "spawn_enemy", owner, bee, 1)
	#spawner.emit_signal("spawn_enemy", owner, bee, 1)

func get_state_name():
	return "Burst"




func _on_burst_detection_body_entered(body):
	call_deferred("emit_signal", "interrupt_state", "Burst")
