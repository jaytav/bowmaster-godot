extends Area2D


func _on_Finish_body_entered(body: Node) -> void:
	MainWorld.clear()
	MainGUI.clear()
	MainGUI.add(Scenes.load("FinishGUI"))
