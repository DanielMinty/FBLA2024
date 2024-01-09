extends Node2D
class_name Interactable

# Miscellaneous
var mouse_in_area: bool = false

# Actions Related
var actions_scene: PackedScene = preload("res://actions/action_layout.tscn")
@onready var actions: Control = actions_scene.instantiate()
var has_action: bool = true
var format_actions_text: String = "You have %s days left."

# Days Related
var days_elasped: int = 0
var DAYS_TIME_LIMIT: int = randi_range(1, 5)
var days_until_new_action: int = randi_range(1, 5)


func _ready() -> void:
	Globals.connect("day_changed", update_ignore_meter)
	actions.visible = false
	$"Action Layout".add_child(actions)
	

func _process(_delta: float) -> void:
	if has_action:
		has_action = false
		actions = actions_scene.instantiate()
		$"Action Layout".add_child(actions)
	if Input.is_action_pressed("primary action") and mouse_in_area:
		actions.visible = true


func update_ignore_meter() -> void:
	if not has_action:
		days_elasped += 1
		if days_elasped >= DAYS_TIME_LIMIT:
			# impact grade
			Globals.GRADE -= 0.01
			$"Ignore Meter".value = 0
			days_elasped = 0
			actions.queue_free()
			DAYS_TIME_LIMIT = randi_range(1, 5)
		else:
			$"Ignore Meter".value += (1 / DAYS_TIME_LIMIT) * 100
			change_ignore_meter_color()
			actions.get_child(0).get_child(0).get_child(1).text += format_actions_text % str(DAYS_TIME_LIMIT - days_elasped)
	else:
		days_until_new_action -= 1
		if days_until_new_action <= 0:
			DAYS_TIME_LIMIT = randi_range(1, 5)
			days_until_new_action = randi_range(1, 5)
			has_action = true


func change_ignore_meter_color() -> void:
	# Change color value letters
	var current_value: float = $"Ignore Meter".value
	if current_value >= 66:
		$"Ignore Meter".modulate = Color.FIREBRICK
	elif current_value >= 33:
		$"Ignore Meter".modulate = Color.YELLOW
	else:
		$"Ignore Meter".modulate = Color.WEB_GREEN


func save() -> Dictionary:
	mouse_in_area = false
	var save_dict: Dictionary = {
		"path": scene_file_path,
		"actions": {
			"actions_text": get_actions_text(),
			"number_of_actions": actions.number_of_actions
		},
		"has_action": has_action,
		"format_actions_text": format_actions_text,
		"days_elasped": days_elasped,
		"DAYS_TIME_LIMIT": DAYS_TIME_LIMIT, 
		"days_until_new_action": days_until_new_action,
		"$Ignore Meter": {
			"value": $"Ignore Meter".value,
		}
	}
	return save_dict


func get_actions_text() -> Array[String]:
	var actions_text: Array[String] = []
	for i in range(actions.actions.size()):
		actions_text.append(actions.actions[i].get_child(0).get_child(0).get_child(1).text)
	return actions_text


func _on_object_collision_area_mouse_entered():
	mouse_in_area = true


func _on_object_collision_area_mouse_exited():
	mouse_in_area = false

