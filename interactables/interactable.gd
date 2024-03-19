extends Node2D
class_name Interactable


# Actions Related
var actions_scene: PackedScene = preload("res://actions/Base/action_layout.tscn")
@onready var actions: Control = actions_scene.instantiate()
var has_action: bool = true
var format_actions_text: String = "You have %s days left."
var mouse_in_area: bool = false

# Days Related
var days_elasped: int = 0
var DAYS_TIME_LIMIT: int = randi_range(1, 5)
var days_until_new_action: int = randi_range(1, 5)


func _ready() -> void:
	Globals.connect("day_changed", update_ignore_meter)
	actions.connect("action_done", finish_action)
	actions.visible = false
	$"Action Layout".add_child(actions)
	$PointLight2D.energy = 0.5
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("primary action") and mouse_in_area and has_action:
		actions.visible = !actions.visible
		if actions.visible:
			actions.global_position = Vector2(-actions.size / 2)
			actions.scale = Vector2(0.4, 0.4)
		var current_level_background: Sprite2D = get_tree().current_scene.find_child("Main Background")
		current_level_background.modulate.a = 0.5 if actions.visible else 1.0


func finish_action() -> void:
	has_action = false
	$Arrow.visible = false
	$PointLight2D.energy = 0
	days_elasped = 0
	

func update_ignore_meter() -> void:
	if not has_action:
		days_until_new_action -= 1
		if days_until_new_action <= 0:
			DAYS_TIME_LIMIT = randi_range(1, 5)
			days_until_new_action = randi_range(1, 5)
			has_action = true
			$PointLight2D.energy = 0.5
		return

	days_elasped += 1
	if days_elasped >= DAYS_TIME_LIMIT + 1:
		Globals.GRADE -= 0.01
		$"Ignore Meter".value = 0
		days_elasped = 0
		DAYS_TIME_LIMIT = randi_range(1, 5)
		Globals.add_value_to_stat("employee_friendliness", -0.05)
		Globals.add_value_to_stat("public_relations", -0.05)
		$PointLight2D.energy = 0
		has_action = false
	else:
		$"Ignore Meter".value += (1.0 / DAYS_TIME_LIMIT) * 100
		change_ignore_meter_color()


func change_ignore_meter_color() -> void:
	# Change color value letters
	var current_value: float = $"Ignore Meter".value
	if current_value >= 66:
		$"Ignore Meter".modulate = Color.RED
	elif current_value >= 33:
		$"Ignore Meter".modulate = Color.YELLOW


func save() -> Dictionary:
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
	if actions.get("actions") == null:
		return []
	for i in range(actions.actions.size()):
		actions_text.append(actions.actions[i].find_child("Text").text)
	return actions_text


func _on_object_collision_area_mouse_entered():
	mouse_in_area = true


func _on_object_collision_area_mouse_exited():
	mouse_in_area = false
