class_name Effect
extends Timer

export (float) var length
export (float) var tick


func _ready() -> void:
	start(tick)


func _process(delta: float) -> void:
	length -= delta
	
	if length < 0:
		queue_free()


# Determines whether effect is applyable to an Entity
func can_apply(entity: Node) -> bool:
	return true


# Action taken every tick
func do_effect() -> void:
	pass


func _on_Effect_timeout() -> void:
	do_effect()
