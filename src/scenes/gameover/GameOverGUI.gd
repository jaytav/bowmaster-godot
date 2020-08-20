extends Control

func _on_RestartButton_pressed():
	MainGUI.clear()
	MainGUI.add(Scenes.GameGUI)
	MainWorld.add(Scenes.GameWorld)


func _on_MainMenuButton_pressed():
	MainGUI.clear()
	MainGUI.add(Scenes.MainMenuGUI)
