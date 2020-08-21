
extends Node

func _ready():
	MainWorld.init(get_node("World"))
	MainGUI.init(get_node("GUI"))
	MainGUI.add(Scenes.MainMenuGUI)
