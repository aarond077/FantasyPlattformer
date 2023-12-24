extends State

class_name HiveBreakState

@export var bee_node : PackedScene
@export var spawn_amount_break : int

@onready var break_detection : Area2D = $"../../BreakDetection"
@onready var spawner : Spawner = $"../../Spawner"
@onready var dead_animation_name : String = "break"

# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	can_move = false
	break_detection.monitoring = false
	animation_player.play("break")
	
func spawn_bee():
	var bee = bee_node.instantiate()
	bee.position = owner.position + Vector2(20, 0)
	spawner.call_deferred("spawn", owner, bee, spawn_amount_break)

func get_state_name():
	return "Break"



func _on_break_detection_body_entered(body):
	call_deferred("emit_signal", "interrupt_state", "Break")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == dead_animation_name:
		owner.queue_free()
