extends Label

@onready var state_machine : FiniteStateMachine = $"../FiniteStateMachine"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "State : " + state_machine.current_state.get_state_name()
