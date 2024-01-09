extends Node


func _ready():
	FileAccess.open_encrypted_with_pass("res://track_of_games.save", FileAccess.WRITE, "Friends")
	for i in range(5):
		FileAccess.open_encrypted_with_pass("res://saves%s.save" % str(i), FileAccess.WRITE, "Family")

# VARIABLES
# Player Related
var stats: Dictionary = {"profit": 0.1, 
	"public_relations": 0.1, "employee_friendliness": 0.1, 
	"product_quality": 0.1, "environment_indicators": 0.1
}

var days_since_start: int = 0:
	set(value):
		days_since_start = value
		day_changed.emit()
		if days_since_start >= DAYS_THRESHOLD:
			fail()
			
var amount_of_actions: int = 3:
	set(value):
		if Globals.mode:
			SaveGame.save_game(current_game)
		amount_of_actions = value
		if amount_of_actions <= 0:
			days_since_start += 1
			GRADE = update_grade()
			amount_of_actions = 3
			
# It's in ALL CAPS to make it different from all the other grade related things
var GRADE: float = update_grade():
	set(value):
		GRADE = value
		if GRADE >= GRADE_THRESHOLD:
			win()

# Game Related
var mode: String = ""
enum action_type {placeholder = -1, board = 2, regular = 4}
var texts: Array[Dictionary] = []
var DAYS_THRESHOLD: int = 365
var GRADE_THRESHOLD: float = 0.9 
var grades: Dictionary = {0.97: "A+", 0.93: "A", 0.9: "A-", 0.87: "B+", 
	0.83: "B", 0.8: "B-", 0.77: "C+", 0.73: "C", 0.7: "C-", 0.67: "D+",
	0.63: "D", 0.6: "D-"
}
var current_game: int


# Pause Menu Related
var paused: bool = false:
	set(value):
		await get_tree().create_timer(0.05).timeout
		paused = value

# SIGNALS
signal day_changed


# FUNCTIONS
# When player fails the game after passing DAYS_THRESHOLD
func fail() -> void:
	pass # trigger lose scene
	

# When player wins the game after passing GRADE_THRESHOLD
func win() -> void:
	# First: Ask to continue playing
	# Second: do this
	var format_displayed_grade: String = "You got an %s"
	var _displayed_grade = format_displayed_grade % evaluate_grade()
	var _leaderboard_scene: Script = preload("res://ui/local_leaderboard.gd")
	# do more stuff with leaderboard


func evaluate_grade() -> String:
	for number_grade in grades:
		if GRADE >= number_grade:
			return grades[number_grade]
	return "F"
	

func update_grade() -> float:
	var res: float = 0.0
	for stat in stats:
		var value: float = stats[stat]
		res += value * 0.2
	return res

