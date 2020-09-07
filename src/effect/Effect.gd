class_name Effect
extends Timer

export (float) var _length
export (float) var _tick


func _ready():
	start(_tick)


func _process(delta):
	_length -= delta
	
	if _length < 0:
		queue_free()


# Action taken every tick
func do_effect():
	print("doing effect")
	pass


func _on_Effect_timeout():
	do_effect()
