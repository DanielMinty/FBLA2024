extends Control
# CHANGE
var number_of_actions: int = Globals.action_type.placeholder
var action_scene = preload("res://actions/action.tscn")


func _ready():
	for i in range(number_of_actions):
		var action: Node
		if i < 3:
			action = action_scene.instantiate()
		else:
			action = preload("res://actions/close.tscn").instantiate()
		action.connect("close", close)
		# UNCOMMENT
		action.get_child(0).text = "d"#Globals.texts[randi_range(0,  Globals.texts.size() - 1)].Text
		$Options.add_child(action)


func close(type):
	if type == "close":
		$".".visible = false
	else:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




