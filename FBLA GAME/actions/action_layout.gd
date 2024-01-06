extends Control
# CHANGE
var number_of_actions: int = Globals.action_type.placeholder
var action_scene = preload("res://actions/action.tscn")


func _ready() -> void:
	for i in range(number_of_actions):
		var action: Node
		if i < 3:
			action = action_scene.instantiate()
			action.get_child(0).text = ""#Globals.texts[randi_range(0,  Globals.texts.size() - 1)].Text
		else:
			action = preload("res://actions/close.tscn").instantiate()
			action.get_child(0).text = "Close"
		action.connect("close", close)
		# UNCOMMENT
		$Options.add_child(action)


func close(type) -> void:
	if type == "close":
		$".".visible = false
	else:
		queue_free()






