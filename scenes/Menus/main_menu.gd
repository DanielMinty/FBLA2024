extends Control


@onready var tutorial_scene: PackedScene = preload("res://scenes/Levels/tutorial.tscn")
@onready var choose_game_scene: PackedScene = preload("res://scenes/Menus/choose_games.tscn")
@onready var pause_menu = PauseMenu


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(choose_game_scene)


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_packed(tutorial_scene)


func _on_leaderboard_pressed():
	get_tree().change_scene_to_file("res://ui/local_leaderboard.tscn")
