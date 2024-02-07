extends Node2D

@onready var interactable : Interactable = $Interactable
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var activated : bool = false
@export var scene_name : String 
# Called when the node enters the scene tree for the first time.
func _ready():
	interactable.call_deferred("connect", "interaction_changed", on_interaction_changed)
	if self.scene_name in SceneLogic.travel_obelisks:
		activated = true
	if activated: 
		animation_player.play("activated")
	else :
		animation_player.play("unactivated")


func on_interaction_changed(): #obelisk saves game and activates if not activated
	if not activated:
		activated = true
	
		
		
		SignalBus.emit_signal( "active_obelisk", scene_name, self.position)
		
		if scene_name not in SceneLogic.travel_obelisks:
			SceneLogic.travel_obelisks.append(scene_name)#add obelisk to array
		
		SignalBus.emit_signal( "save_game", SceneLogic.player.position)
		
	
		animation_player.play("activated")
	else:
		SignalBus.call_deferred("emit_signal", "save_game", SceneLogic.player.position)
