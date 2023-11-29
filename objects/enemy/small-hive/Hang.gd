extends State

var can_transition : bool = false
var player_detected : bool = false
@onready var timer : Timer = $Timer

func enter():
	super.enter()
	timer.start()
	can_move = false
	can_transition = false
	animation_player.play("hang")
	
func transition():
	super.transition()
	if can_transition and player_detected:
		get_parent().change_state("Spawn")

func exit():
	super.exit()
	can_transition = false

func _on_timer_timeout():
	can_transition = true
	
func get_state_name():
	super.get_state_name()
	return "Hang"


func _on_player_detection_body_entered(body):
	player_detected = true


func _on_player_detection_body_exited(body):
	player_detected = false
