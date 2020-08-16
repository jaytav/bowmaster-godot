extends Label

onready var state_machine = get_parent().get_node("StateMachine")

func _process(delta):
	text = state_machine.state.name
