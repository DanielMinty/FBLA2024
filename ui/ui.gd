extends CanvasLayer


func _process(_delta):
	# For timer
	$Timer/PanelContainer/HBoxContainer/Label.text = str(Globals.amount_of_actions)
	
	# For stats
	$Stats/Panel/VBoxContainer/Profit/Label.text = str(Globals.stats["profit"])
	$"Stats/Panel/VBoxContainer/Environment Indicators/Label".text = str(Globals.stats["environment_indicators"])
	$"Stats/Panel/VBoxContainer/Employee Friendliness/Label".text = str(Globals.stats["employee_friendliness"])
	$"Stats/Panel/VBoxContainer/Public Relations/Label".text = str(Globals.stats["public_relations"])
	$"Stats/Panel/VBoxContainer/Product Quality/Label".text = str(Globals.stats["product_quality"])
