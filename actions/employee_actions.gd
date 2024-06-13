extends action_layout


var dialouge: Control = preload("res://NPC/NPCdialoge.tscn").instantiate()
@onready var emp_info: Label = $Background/VBoxContainer/Text
@onready var background: PanelContainer = $Background
@onready var view_port_size: Vector2 = Vector2(get_viewport().size)



func _ready():
	number_of_actions = Globals.action_type.board
	
	dialouge.label = emp_info
	
	
	number_of_actions = Globals.action_type.regular
	dialouge.start_dialogue()
	add_child(dialouge)
	super._ready()
