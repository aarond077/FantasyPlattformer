extends StateNew

@export var minion_node : PackedScene
var can_transition : bool = false

# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	animation_player.play("summon")
	
func spawn():
	var minion = minion_node.instantiate()
	minion.position = owner.position + Vector2(40, -40)
	get_tree().current_scene.add_child(minion)
func do_transition():
	can_transition = true
	
func transition():
	if can_transition:
		get_parent().change_state("Follow")
		can_transition = false
