extends Control

func _on_RestartButton_pressed():
	MainGUI.clear()
	MainWorld.add(Scenes.load("GameWorld"))
	MainGUI.add(Scenes.load("GameGUI"))


func _on_MainMenuButton_pressed():
	MainGUI.clear()
	MainGUI.add(Scenes.load("MainMenuGUI"))
