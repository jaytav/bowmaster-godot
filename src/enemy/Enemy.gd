extends Entity

export (int) var damage

func _on_Hitbox_body_entered(body):
	if body.has_node("Stats/Health"):
		var body_health = body.get_node("Stats/Health")
		body_health.take_damage(damage)


func _on_Health_current_health_updated(current_health):
	if current_health == 0:
		queue_free()
