extends Interactable


func _ready() -> void:
	$"Action Layout".add_child(actions)


func _process(delta: float) -> void:
	if not has_action:
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play("up_and_down")
		
	if Input.is_action_just_pressed("primary action") and mouse_in_area and has_action:
		get_tree().change_scene_to_file("res://scenes/inside_scenes/computer.tscn")
