extends Level


var main_background_size: Vector2
var main_background_scale: Vector2
@onready var dialouge: Control = preload("res://Dialouge/dialoge.tscn").instantiate()
@onready var board_dialouge: Control = preload("res://actions/Base/board_actions.tscn").instantiate()


func _ready() -> void:
	main_background_scale = $"Backgrounds/Main Background".scale
	main_background_size = $"Backgrounds/Main Background".region_rect.size * main_background_scale

	add_child(board_dialouge)
