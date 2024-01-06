extends CanvasLayer


func _process(_delta):
	# For timer
	$Timer/HBoxContainer/Label.text = str(Globals.amount_of_actions)
	
	# For stats
	$Stats/VBoxContainer/Profit/Label.text = str(Globals.stats["profit"])
	$"Stats/VBoxContainer/Environment Indicators/Label".text = str(Globals.stats["environment_indicators"])
	$"Stats/VBoxContainer/Employee Friendliness/Label".text = str(Globals.stats["employee_friendliness"])
	$"Stats/VBoxContainer/Public Relations/Label".text = str(Globals.stats["public_relations"])
	$"Stats/VBoxContainer/Product Quality/Label".text = str(Globals.stats["product_quality"])
