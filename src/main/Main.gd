
extends Node

func _ready() -> void:
	MainWorld.init(get_node("World"))
	MainGUI.init(get_node("GUI"))
	MainGUI.add(Scenes.load("MainMenuGUI"))
