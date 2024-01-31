extends State

# Called when the node enters the scene tree for the first time.
func enter():
	sprite.flip_h = !sprite.flip_h
	animation_player.play("idle")
