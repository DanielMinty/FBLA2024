extends Control
class_name action_layout


var number_of_actions: int = Globals.action_type.regular
var action_scene: PackedScene = preload("res://actions/Base/action.tscn")
var close_action_scene: PackedScene = preload("res://actions/Base/close.tscn")
var previous_action_texts: Array[String] = []
var action_type: String
var actions: Array[VBoxContainer] = []
signal action_done


func _ready() -> void:
	if number_of_actions == 4:
		action_type = "Regular"
	else:
		action_type = "Board"
	
	make_actions()
	

func make_actions() -> void:
	var action: VBoxContainer
	for i in range(number_of_actions):
		if i < 3:
			action = action_scene.instantiate()
			var random_action: Dictionary = get_action()

			while (
				previous_action_texts.find(random_action) != -1 or 
				random_action["Mode(s)"].get(Globals.mode, false) == false or 
				random_action.Type != action_type
			):
				random_action = get_action()
			
			action.find_child("Text").text = random_action.Text
			action.impacted_stats = random_action.Stats
		else:
			action = close_action_scene.instantiate()
			action.find_child("Text").text = "Close Actions? You can view this later."
		action.connect("close", close)
		actions.append(action)
		$Background/VBoxContainer/Options.add_child(action)


func close(type: String) -> void:
	var current_level_background: Sprite2D = get_tree().current_scene.find_child("Main Background")
	current_level_background.modulate.a = 1
	
	if type == "close":
		visible = false
	else:
		action_done.emit()
		close_actions()


func close_actions() -> void:
	for action in $Background/VBoxContainer/Options.get_children():
		action.queue_free()
		visible = false
	if action_type == "Board":
		get_tree().change_scene_to_file("res://scenes/Levels/office.tscn")


func get_action() -> Dictionary:
	return Globals.customer_review_texts[randi_range(0,  Globals.customer_review_texts.size() - 1)]


