extends Control

func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
	
