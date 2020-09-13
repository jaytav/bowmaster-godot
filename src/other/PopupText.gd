extends Popup

export (Vector2) var initial_position
export (String) var value
export (float) var time

onready var _timer: Timer = $Timer
onready var _label: Label = $Label


func _ready():
	_label.text = value
	_timer.start(time)
	set_position(initial_position)
	popup()


func _on_Timer_timeout():
	queue_free()
