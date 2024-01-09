extends Control


# CHANGE
var number_of_actions: int = Globals.action_type.placeholder
var action_scene = preload("res://actions/action.tscn")
var actions: Array[VBoxContainer] = []


func _ready() -> void:
	for i in range(number_of_actions):
		actions.append(action_scene.instantiate())
		if i < 3:
			actions[i].get_child(0).get_child(0).get_child(1).text = ""#Globals.texts[randi_range(0,  Globals.texts.size() - 1)].Text
		else:
			actions[i].get_child(0).get_child(0).get_child(1).text = "Close"
		actions[i].connect("close", close)
		$Background/VBoxContainer/Options.add_child(actions[i])
	

func close(type: String) -> void:
	if type == "close":
		visible = false
	else:
		queue_free()




