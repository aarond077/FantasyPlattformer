extends State

class_name PlayerStompState

@onready var stomp_animation_name : String = "stomp"

# Called when the node enters the scene tree for the first time.
func enter():
	animation_player.play("dead")
	#character.visible = false

func get_state_name():
	return "Dead"
