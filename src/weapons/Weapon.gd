class_name Weapon
extends Entity

export (bool) var _destroy_on_impact

onready var damage: Node = $Stats/Damage


func _on_DamageSource_body_entered(body):
	if body.has_node("Stats/Health"):
		var body_health = body.get_node("Stats/Health")
		body_health.take_damage(damage.amount)
	
	if _destroy_on_impact:
		queue_free()
