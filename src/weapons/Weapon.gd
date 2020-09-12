tool
class_name Weapon
extends Entity

export (bool) var _destroy_on_impact

onready var damage: Node = $Stats/Damage


func _on_DamageSource_body_entered(body: Node) -> void:
	if body is Entity:
		body.apply_effect(EffectLoader.get_instance("FlatDamage", {"value": damage.value}))
	
	
	if _destroy_on_impact:
		queue_free()
