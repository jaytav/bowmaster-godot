extends Control

func _on_RestartButton_pressed():
	MainGUI.clear()
	MainWorld.add(Scenes.GameWorld)
	MainGUI.add(Scenes.GameGUI)


func _on_MainMenuButton_pressed():
	MainGUI.clear()
	MainGUI.add(Scenes.MainMenuGUI)
