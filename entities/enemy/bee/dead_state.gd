extends State

@onready var timer : Timer = $Timer
@onready var player_detection : Area2D = $"../../PlayerDetection"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func enter():
	super.enter()
	player_detection.monitoring = false
	can_move = false
	timer.start()
	animation_player.play("dead")
	#owner.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func get_state_name():
	return "Dead"


func _on_timer_timeout():
	owner.queue_free()
