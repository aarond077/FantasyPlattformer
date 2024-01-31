extends State

@export var hit_box : CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func enter():
	super.enter()
	can_move = false
	animation_player.play("dead")
	
func get_state_name():
	return "Dead"
