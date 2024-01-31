extends State

@export var ground_state : String = "Ground"
@onready var shoe : Area2D = $"../../Shoe"
@onready var stomp_animation : String = "stomp"


# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	shoe.set_deferred("monitoring", false)
	animation_player.play("stomp")

func exit():
	super.exit()
	shoe.set_deferred("monitoring", false)
	
func get_state_name():
	return "Stomp"
	



func _on_animation_player_animation_finished(anim_name):
	if(anim_name == stomp_animation):
		emit_signal("interrupt_state", ground_state)
