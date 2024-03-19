extends action_layout


var dialouge: Control = preload("res://Dialouge/dialoge.tscn").instantiate()
@onready var board_info: Label = $Background/VBoxContainer/Text


func _ready():
	number_of_actions = Globals.action_type.board
	super._ready()
	
	dialouge.label = board_info
	
	dialouge.scale *= 5 * 3.5
	add_child(dialouge)

