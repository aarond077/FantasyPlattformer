extends StateNew

@onready var collision = $"../../PlayerDetection/CollisionShape2D2"
@onready var progress_bar = owner.find_child("ProgressBar")

var player_entered : bool = false:
	set(value):
		player_entered = value
		collision.set_deferred("disabled", value)
		progress_bar.set_deferred_thread_group("visible", value)


func _on_player_detection_body_entered(body):
	player_entered = true
	
func transition():
	if(player_entered):
		get_parent().change_state("Follow")
