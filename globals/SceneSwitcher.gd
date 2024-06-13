extends Node


enum SCENE {OFFICE = 0, TUTORIAL = 1, BOARD = 2, FACTORY = 3, COMPUTER = 4, MENU = 5}
@onready var scenes: Array[Node] = [
	preload("res://scenes/Levels/office.tscn").instantiate(),
	preload("res://scenes/Levels/tutorial.tscn").instantiate(),
	preload("res://scenes/Levels/board.tscn").instantiate(),
	preload("res://scenes/Levels/factory.tscn").instantiate(),
	preload("res://scenes/inside_scenes/computer.tscn").instantiate()
]
var current_scene: SCENE = SCENE.MENU


func _ready():
	for scene in scenes:
		get_tree().root.add_child.call_deferred(scene)

	show_scene(SCENE.MENU)


func show_scene(scene: SCENE) -> void:
	if scene == SCENE.MENU:
		for s in range(len(scenes)):
			scenes[s].visible = false
		return
	scenes[scene].visible = true 
	
	if scene == SCENE.BOARD:
		scenes[scene].add_dialouge()
	
	if scene != SCENE.MENU and scene != SCENE.COMPUTER and scene != SCENE.BOARD:
		UI.visible = true
	else:
		UI.visible = false

	for s in range(len(scenes)):
		if s != scene:
			scenes[s].visible = false
