extends action_layout


var dialouge: Control = preload("res://Dialouge/dialoge.tscn").instantiate()
@onready var board_info: Label = $Background/VBoxContainer/Text
@onready var background: PanelContainer = $Background
@onready var view_port_size: Vector2 = Vector2(get_viewport().size)


func _ready():
	number_of_actions = Globals.action_type.board
	super._ready()
	
	dialouge.label = board_info
	
	add_child(dialouge)


func _process(_delta):
	calculate_center()


func calculate_center() -> void:
	# To get correct size
	background.global_position = Vector2.ZERO
	
	background.global_position = abs((background.size - view_port_size) / 4)
	#print(background.global_position)

