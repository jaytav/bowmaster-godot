class_name State
extends Node
# If enter, exit, unhandled_input and physics_process
# is not defined, automatically calls parents function

var parent: State = null

onready var state_machine = _get_state_machine(self)


func _ready():
	yield(owner, "ready")
	
	if not get_parent().is_in_group("state_machine"):
		parent = get_parent() as State


# Entering state
func enter():
	if parent:
		parent.enter()


# Exiting state
func exit():
	if parent:
		parent.exit()


# used in StateMachine::_unhandled_input(event)
func unhandled_input(event):
	if parent:
		parent.unhandled_input(event)


# used in StateMachine::_physics_process(delta)
func physics_process(delta):
	if parent:
		parent.unhandled_input(delta)


func _get_state_machine(node: Node):
	if node != null and not node.is_in_group("state_machine"):
		return _get_state_machine(node.get_parent())
	
	return node
