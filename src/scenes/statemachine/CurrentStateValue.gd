extends Label

export (NodePath) var state_machine_path

var _state_machine: StateMachine = null


func _ready() -> void:
	_state_machine = get_node(state_machine_path)


func _process(delta: float) -> void:
	text = _state_machine.state.name
