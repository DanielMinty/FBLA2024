extends Control


@onready var popup=$Window
@onready var pause_menu=$PauseMenu
var paused=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale=1
	else:
		pause_menu.show()
		Engine.time_scale=0
	paused=!paused


func _on_start_pressed():
	get_tree().change_scene_to_file("res://gameeeee.tscn")#insert the scene into here from filesystem)


func _on_quit_pressed():
	get_tree().quit()


func _on_tutorial_pressed():
	popup.show()


func _on_window_close_requested():
	popup.hide()
