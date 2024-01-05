extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_paused_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
	



func _on_resume_pressed():
	$MarginContainer/VBoxContainer/Resume.visible = false
	$MarginContainer/VBoxContainer/Settings.visible = false
	$MarginContainer/VBoxContainer/Save.visible = false
	$MarginContainer/VBoxContainer/Quit_Paused.visible = false
	
