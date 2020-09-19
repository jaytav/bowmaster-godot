extends Room

onready var _player: PackedScene = preload("res://src/player/Player.tscn")
onready var _spawn_position: Position2D = $SpawnPosition


func _ready():
	var player_instance = _player.instance()
	player_instance.position = _spawn_position.position
	MainWorld.add_to(player_instance, "GameWorld")
