extends Control
# do = [preload(...), ...]
var number_of_actions: int = Globals.action_type.placeholder
var action_scene = preload("res://actions/action.tscn")


func _ready():
	for i in range(number_of_actions):
		var action = action_scene.instantiate()
		action.connect("close", close)
		action.label.text = "" # get random text
		add_child(action)


func close(type):
	if type == "close":
		$".".visible = false
	else:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass




