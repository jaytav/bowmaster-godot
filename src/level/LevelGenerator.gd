class_name LevelGenerator
extends Object


static func create(rooms: Array) -> void:
	var next_room_position = Position2D.new()
	
	for room in rooms:
		room = RoomLoader.get_instance(room)
		room.position = next_room_position.get_global_position()
		MainWorld.add(room)
		
		next_room_position = room.next_room_position

