extends Node2D
class_name Level


var days_passed: int = 0


func _ready():
	Globals.connect("day_changed", check_board_summon)


func check_board_summon():
	days_passed += 1
	if days_passed >= 7:
		days_passed = 0
		get_tree().change_scene("res://scenes/board.tscn")
