extends Node2D
class_name interactable

# Miscellaneous
var mouse_in_area: bool = false

# Actions Related
var actions_scene: PackedScene = preload("res://actions/action_layout.tscn")
@onready var actions: Control = actions_scene.instantiate()
var has_action: bool = true
var format_actions_text: String = "You have %s days left."

# Days Related
var days_elasped: int = 0
var DAYS_TIME_LIMIT: int = randi_range(1, 14)
var days_until_new_action: int = randi_range(1, 5)


func _ready():
	Globals.connect("day_changed", update_ignore_meter)
	actions.visible = false
	$"Action Layout".add_child(actions)


func _process(_delta):
	if has_action:
		has_action = false
		actions = actions_scene.instantiate()
		$"Action Layout".add_child(actions)
	if Input.is_action_pressed("primary action") and mouse_in_area:
		actions.visible = true


func update_ignore_meter():
	if not has_action:
		days_elasped += 1
		if days_elasped >= DAYS_TIME_LIMIT:
			$"Ignore Meter".value = 0
			days_elasped = 0
			actions.queue_free()
		else:
			#warning-ignore:integer_division
			$"Ignore Meter".value += (1 / DAYS_TIME_LIMIT) * 100
			change_ignore_meter_color()
			actions.get_child(1).text += format_actions_text % str(DAYS_TIME_LIMIT - days_elasped)
	else:
		days_until_new_action -= 1
		if days_until_new_action <= 0:
			has_action = true


func change_ignore_meter_color():
	# Change color value letters
	var current_value: float = $"Ignore Meter".value
	if current_value >= 66:
		$"Ignore Meter".modulate = Color.FIREBRICK
	elif current_value >= 33:
		$"Ignore Meter".modulate = Color.YELLOW
	else:
		$"Ignore Meter".modulate = Color.WEB_GREEN


func _on_collision_area_mouse_entered():
	mouse_in_area = true


func _on_collision_area_mouse_exited():
	mouse_in_area = false
