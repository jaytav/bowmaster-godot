class_name EnemyWeapon
extends Node


func _process(delta):
	if can_attack():
		attack()


func attack():
	pass


func can_attack() -> bool:
	return false
