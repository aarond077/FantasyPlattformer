extends Label

@export var damageable : Damageable 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Health : " + str(damageable.health)
