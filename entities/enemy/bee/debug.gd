extends Label

@onready var state_machine : FiniteStateMachine = $"../FiniteStateMachine"

func _process(delta):
	text = state_machine.current_state.get_state_name()
