extends Control

onready var _game_menu = $GameMenu

# Stats
onready var _player_stats: Node = MainWorld.get("Game/Player/Stats")

# Health
onready var _player_health_over_ui: TextureProgress = $PlayerHealth/Over
onready var _player_health_under_ui: TextureProgress = $PlayerHealth/Under
onready var _player_health_update_tween: TextureProgress = $PlayerHealth/UpdateTween
onready var _player_health: Health = _player_stats.get_node("Health")

# Ammo
onready var _player_ammo_ui: Label = $PlayerAmmo
onready var _player_ammo: Ammo = _player_stats.get_node("Ammo")


func _ready() -> void:
	# Health
	_on_Player_health_updated(_player_health.value)
	_player_health.connect("value_updated", self, "_on_Player_health_updated")
	
	# Ammo
	_on_Player_ammo_updated(_player_ammo.value)
	_player_ammo.connect("value_updated", self, "_on_Player_ammo_updated")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		_game_menu.visible = !_game_menu.visible
		get_tree().paused = _game_menu.visible


func _on_Player_health_updated(value: int) -> void:
	_player_health_over_ui.value = (float(value) / _player_health.max_value) * 100
	_player_health_update_tween.interpolate_property(_player_health_under_ui, "value", _player_health_under_ui.value, _player_health_over_ui.value, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	_player_health_update_tween.start()


func _on_Player_ammo_updated(value: int) -> void:
	_player_ammo_ui.text = str(value) + " / " + str(_player_ammo.max_value)
