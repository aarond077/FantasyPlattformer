extends StateNew

func _enter_tree():
	randomize()

# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	owner.set_physics_process(true)
	animation_player.play("idle")
	
func exit():
	super.exit()
	owner.set_physics_process(false)
	
	
func transition():
	if owner.direction.length() < 40:
		get_parent().change_state("Attack")
	if owner.direction.length() > 200: 
		var chance = randi() % 2
		match chance:
			0: 
				get_parent().change_state("SpawnMinion")
			1:
				get_parent().change_state("Teleport")
