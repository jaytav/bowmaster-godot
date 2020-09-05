extends Node

signal current_ammo_updated(current_ammo)

export (int) var capacity

onready var current_ammo = capacity setget set_current_ammo

func shoot():
	self.current_ammo = clamp(current_ammo - 1, 0, capacity)


func replenish():
	self.current_ammo = clamp(current_ammo + 1, 0, capacity)


func set_current_ammo(amount: int):
	current_ammo = amount
	emit_signal("current_ammo_updated", current_ammo)
