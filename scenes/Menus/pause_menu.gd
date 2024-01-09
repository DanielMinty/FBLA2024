extends Window


@onready var background = get_tree().current_scene.get_child(0)


func _ready() -> void:
	visible = false


func _process(_delta) -> void:
	if Input.is_action_just_pressed("pause"):
		do_pause_menu()


func do_pause_menu() -> void:
	background = get_tree().current_scene.get_child(0)
	if not Globals.paused:
		if background is Panel:
			background.visible = true
		elif background is Sprite2D:
			background.modulate = Color(1, 1, 1, 0.5)
		visible = true
	else:
		if background is Panel:
			background.visible = false
		elif background is Sprite2D:
			background.modulate = Color(1, 1, 1, 1)
		visible = false
	Globals.paused = !Globals.paused


func _on_save_pressed() -> void:
	SaveGame.save_game(Globals.current_game)


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_resume_pressed() -> void:
	do_pause_menu()


func _on_quit_pressed() -> void:
	get_tree().quit()

