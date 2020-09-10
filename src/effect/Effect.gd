class_name Effect
extends Timer

export (float) var length
export (float) var tick


func _ready():
	start(tick)


func _process(delta):
	length -= delta
	
	if length < 0:
		queue_free()


# Determines whether effect is applyable to an Entity
func can_apply(entity: Node) -> bool:
	return true


# Action taken every tick
func do_effect():
	pass


func _on_Effect_timeout():
	do_effect()
