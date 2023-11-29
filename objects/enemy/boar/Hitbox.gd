extends Area2D

@export var state_machine : FiniteStateMachine
@export var damage : int = 20
@export var knockback_speed : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			
			if state_machine.return_current_state().get_state_name() == "BoarAttack":
				var direction_to_damageable = (body.global_position - get_parent().global_position)
				var direction_sign = sign(direction_to_damageable.x)

				if(direction_sign > 0):
					child.hit(damage, Vector2(1, 5), knockback_speed)
			
				elif(direction_sign < 0):
					child.hit(damage, Vector2(-1, 5), knockback_speed)
				else:
					child.hit(damage, Vector2.ZERO, knockback_speed)
