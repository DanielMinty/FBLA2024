extends CanvasLayer


func _process(_delta: float) -> void:
	# For timer
	$Timer/PanelContainer/HBoxContainer/Label.text = str(Globals.amount_of_actions)
	
	# For stats
	$Stats/Panel/VBoxContainer/Profit/Label.text = str(Globals.stats["profit"])
	$"Stats/Panel/VBoxContainer/Environment Indicators/Label".text = str(Globals.stats["environment_indicators"])
	$"Stats/Panel/VBoxContainer/Employee Friendliness/Label".text = str(Globals.stats["employee_friendliness"])
	$"Stats/Panel/VBoxContainer/Public Relations/Label".text = str(Globals.stats["public_relations"])
	$"Stats/Panel/VBoxContainer/Product Quality/Label".text = str(Globals.stats["product_quality"])
	
	
func optional_continue(grade: String, text: String = " Would you like to continue playing or stop?") -> void:
	$"Optional Continue Scene".visible = true
	$"Optional Continue Scene/VBoxContainer/Text".text = grade + text
	

func _on_button_pressed() -> void:
	$"Optional Continue Scene".visible = false


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/local_leaderboard.tscn")
	visible = false
