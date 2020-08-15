extends Label


func _on_TestStateMachine_state_changed(new_state):
	text = new_state.name
