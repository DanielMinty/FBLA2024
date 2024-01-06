extends Node


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
		amount_of_actions = value
		if amount_of_actions <= 0:
			days_since_start += 1
			GRADE = update_grade()
			amount_of_actions = 3
			
var GRADE: float = update_grade():
	set(value):
		GRADE = value
		if GRADE >= GRADE_THRESHOLD:
			win()

# Game Related
var mode: String
enum action_type {placeholder = -1, board = 2, regular = 4}
var texts: Array[Dictionary] = []
const DAYS_THRESHOLD: int = 365
const GRADE_THRESHOLD: float = 0.9 
var grades: Dictionary = {0.97: "A+", 0.93: "A", 0.9: "A-", 0.87: "B+", 
	0.83: "B", 0.8: "B-", 0.77: "C+", 0.73: "C", 0.7: "C-", 0.67: "D+",
	0.63: "D", 0.6: "D-"
}
signal day_changed


# When player fails the game after passing DAYS_THRESHOLD
func fail() -> void:
	pass # trigger lose scene
	

# When player wins the game after passing GRADE_THRESHOLD
func win() -> String:
	# First: Ask to continue playing
	# Second
	var format_displayed_grade: String = "You got an %s"
	var displayed_grade = format_displayed_grade % evaluate_grade()
	return displayed_grade


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


