extends StateNew

func enter():
	super.enter()
	combo()

func attack(move = "1"):
	animation_player.play("attack_" + move)
	await animation_player.animation_finished
	
func combo():
	var move_set = ["1", "1", "2"]
	for move in move_set:
		await attack(move)

	combo()
	
func transition():
	if owner.direction.length() > 40:
		get_parent().change_state("Follow")
