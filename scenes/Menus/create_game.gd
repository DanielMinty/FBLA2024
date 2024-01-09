extends Control


@onready var create_custom_game_scene: PackedScene = preload("res://scenes/Menus/create_custom_game.tscn")
@onready var office_scene: PackedScene = preload("res://scenes/Levels/office.tscn")


func _ready() -> void:
	SaveGame.load_track_of_games()


func _on_game_1_pressed() -> void:
	Globals.current_game = 3
	if !TrackOfGames.create_has_game[0]:
		TrackOfGames.create_has_game[0] = true
		get_tree().change_scene_to_packed(create_custom_game_scene)
	else:
		SaveGame.load_game(3)
		get_tree().change_scene_to_packed(office_scene)
	SaveGame.save_track_of_games()


func _on_game_2_pressed() -> void:
	Globals.current_game = 4
	if !TrackOfGames.create_has_game[1]:
		TrackOfGames.create_has_game[1] = true
		get_tree().change_scene_to_packed(create_custom_game_scene)
	else:
		SaveGame.load_game(4)
		get_tree().change_scene_to_packed(office_scene)
	SaveGame.save_track_of_games()
