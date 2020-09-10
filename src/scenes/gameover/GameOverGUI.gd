extends Control

func _on_RestartButton_pressed() -> void:
	MainGUI.clear()
	MainWorld.add(Scenes.load("GameWorld"))
	MainGUI.add(Scenes.load("GameGUI"))


func _on_MainMenuButton_pressed() -> void:
	MainGUI.clear()
	MainGUI.add(Scenes.load("MainMenuGUI"))
