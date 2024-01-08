extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_resume_pressed():
	$VBoxContainer/Resume.visible = false
	$VBoxContainer/setting.visible = false
	$VBoxContainer/save.visible = false
	$VBoxContainer/quit_pause.visible = false


func _on_quit_pause_pressed():
	get_tree().change_scene_to_file("res://mainmanu.tscn")


