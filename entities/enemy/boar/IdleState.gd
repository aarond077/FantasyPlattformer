extends StateNew

@onready var state_machine : FiniteStateMachine = $FiniteStateMachine

func _ready():
	pass

func _on_player_detection_body_entered(body):
	get_parent().change_state("Attack")

func enter():
	super.enter()
	animation_player.play("idle")
	

func get_state_name():
	return "BoarIdle"
