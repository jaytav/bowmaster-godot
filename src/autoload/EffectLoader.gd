extends Node

var _effects: Dictionary = {}

# Lazy load PackedScene to dictionary and get Effect by name
func get(effect: String) -> Effect:
	if not effect in _effects:
		_effects[effect] = load("src/effect/" + effect + ".tscn")
	
	return _effects[effect].instance()
