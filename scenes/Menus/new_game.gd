extends Control


@onready var office_scene: PackedScene = preload("res://scenes/Levels/office.tscn")


func _on_easy_mode_pressed() -> void:
	Globals.mode = "easy"
	get_tree().change_scene_to_packed(office_scene)
	SaveGame.save_game(Globals.current_game)


func _on_medium_mode_pressed() -> void:
	Globals.mode = "medium"
	get_tree().change_scene_to_packed(office_scene)
	SaveGame.save_game(Globals.current_game)


func _on_hard_mode_pressed() -> void:
	Globals.mode = "hard"
	get_tree().change_scene_to_packed(office_scene)
	SaveGame.save_game(Globals.current_game)
