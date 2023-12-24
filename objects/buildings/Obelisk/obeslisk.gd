extends Node2D

@onready var interactable : Interactable = $Interactable
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var activated : bool = false
@export var szene_name : String 
#@onready var player : Player = get_parent().find_child("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	interactable.call_deferred("connect", "interaction_changed", on_interaction_changed)
	if self.szene_name in SceneLogic.travel_obelisks:
		activated = true
	if activated: 
		animation_player.play("activated")
	else :
		animation_player.play("unactivated")


func on_interaction_changed():
	if not activated:
		activated = true
	
		SignalBus.call_deferred("emit_signal", "save_game")
		
		SignalBus.call_deferred("emit_signal", "active_obelisk", szene_name, self.position)
	
		animation_player.play("activated")
	else:
		SignalBus.call_deferred("emit_signal", "save_game")
