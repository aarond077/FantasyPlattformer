extends Node

class_name GameManager
@export var music_name : String 
@export var new_music_name : String 

#@onready var pause_screen : Control = $CanvasLayer/PauseScreen

func _ready():
	get_tree().paused = false

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		var current_value : bool = get_tree().paused
		get_tree().paused = !current_value


func update_world_travel():
	pass#<pause_screen.
