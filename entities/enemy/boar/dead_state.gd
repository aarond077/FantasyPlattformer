extends State


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func enter():
	can_move = false
	animation_player.play("dead")
	SceneLogic.dead_enemies.append(character.name)

func get_state_name():
	return "Dead"
