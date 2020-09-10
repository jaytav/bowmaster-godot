extends State

export (float) var _idle_wait_time

onready var _timer: Timer = $Timer

var _turn: bool


func enter(msg: Dictionary = {}) -> void:
	_turn = "turn" in msg
	_timer.start(_idle_wait_time)
	_timer.connect("timeout", self, "_on_Timer_timeout")


func exit() -> void:
	_timer.disconnect("timeout", self, "_on_Timer_timeout")


func _on_Timer_timeout() -> void:
	if _turn:
		parent.turn()
		
	state_machine.transition_to("Move/Run")
