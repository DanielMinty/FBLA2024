extends Node2D


var mouse_in_area: bool = false
var actions_scene: PackedScene = preload("res://actions/action_layout.tscn")
@onready var actions: Control = actions_scene.instantiate()


func _ready():
	var actions: Control = actions_scene.instantiate()
	actions.visible = false
	add_child(actions)


func _process(_delta):
	if Input.is_action_pressed("primary action") and mouse_in_area:
		actions.visible = true
		
	
func _on_collision_area_mouse_entered():
	mouse_in_area = true


func _on_collision_area_mouse_exited():
	mouse_in_area = false
