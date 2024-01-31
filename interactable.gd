extends Node

class_name Interactable

@export var player_interaction_name : String 

@onready var player_interaction : bool = false

signal interaction_changed()


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.call_deferred("connect", "player_interaction", on_player_interaction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_player_interaction():
	if player_interaction:
		SignalBus.call_deferred("emit_signal",
	 	"player_interaction_state",
		 player_interaction_name)
		
		call_deferred("emit_signal", 
		"interaction_changed")


func _on_interaction_detection_body_entered(body):
	player_interaction = true
	SignalBus.call_deferred("emit_signal", "player_can_interact", player_interaction_name)


func _on_interaction_detection_body_exited(body):
	player_interaction = false
	SignalBus.call_deferred("emit_signal", "player_not_interact", player_interaction_name)



