extends Control

onready var state_label: Label = $StateLabel
onready var state_machine: StateMachine = owner.get_node("StateMachine")


func _process(delta):
	state_label.text = state_machine.state.name
