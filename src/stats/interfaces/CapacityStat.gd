class_name CapacityStat
extends Stat

export (int) var max_value


func _ready():
	self.value = max_value


func set_value(new_value: int):
	.set_value(clamp(new_value, 0, max_value))
