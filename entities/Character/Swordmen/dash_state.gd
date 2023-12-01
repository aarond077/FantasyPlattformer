extends State

class_name PlayerDashState


@onready var dash_animation : String = "dash"
@onready var dash_direction : Vector2
@onready var dash_speed : float = 40.0
@onready var dash_stopped : bool = false

# Called when the node enters the scene tree for the first time.
func enter():
	animation_player.play("dash")

func state_process(delta):
	character.velocity += dash_direction * dash_speed
	character.direction = dash_direction
	character.update_facing_direction()



func get_state_name():
	return "Dash"
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == dash_animation:
		emit_signal("interrupt_state", get_parent().previous_state.get_state_name() )
