tool
class_name Weapon
extends Entity

export (bool) var _destroy_on_impact

onready var damage: Node = $Stats/Damage


func _on_DamageSource_body_entered(body: Node) -> void:
	if body is Entity:
		var flat_damage = EffectLoader.get_instance("FlatDamage")
		flat_damage.value = damage.value
		body.apply_effect(flat_damage)
	
	
	if _destroy_on_impact:
		queue_free()
