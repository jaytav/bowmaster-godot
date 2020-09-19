extends Node2D

func _ready():
	LevelGenerator.create(["Spawn", "Enemy", "Treasure", "Finish"])
