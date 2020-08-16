extends Label

export (NodePath) var state_machine_path

var _state_machine = null


func _ready():
	_state_machine = get_node(state_machine_path)


func _process(delta):
	text = _state_machine.state.name
