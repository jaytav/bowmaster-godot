extends State

export (float) var _stagger_wait_time

onready var _timer: Timer = $Timer


func enter(msg: Dictionary = {}) -> void:
	parent.velocity.y -= 100
	_timer.start(_stagger_wait_time)
	_timer.connect("timeout", self, "_on_Timer_timeout")


func exit() -> void:
	_timer.disconnect("timeout", self, "_on_Timer_timeout")


func _on_Timer_timeout() -> void:
	parent.turn()
	state_machine.transition_to("Move/Run")


func _on_DetectionRange_body_entered(body: Node) -> void:
	state_machine.transition_to("Move/Stagger")
