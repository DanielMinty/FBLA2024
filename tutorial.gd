extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


@onready var label = $MarginContainer/Label
@onready var timer = $letterdispalytimer

const MAX_WIDTH = 256

var text = ""
var letter_index = 0

var lettertime = 0.03
var spacetime = 0.06
var puntime = 0.2

signal finished_displaying()

func display_text(text_to_display: String):
	text = text_to_display
	label.text = text_to_display
	
	await resized
	
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer. AUTOWRAP_WORD
		await resized # wait for x resize
		await resized # wait for y resize
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	
	label.text = "!"
	_display_letter()
	

func _display_letter ():
	label.text += text[letter_index]
	
	letter_index += 1 
	if letter_index >= text.length():
		finished_displaying.emit()
		return
	
	match text[letter_index]:
		".","?","!",",":
			timer.start (puntime)
		" ":
			timer.start (spacetime)
		_:
			timer.start(lettertime)
		

func _on_letterdispalytimer_timeout():
	_display_letter()
