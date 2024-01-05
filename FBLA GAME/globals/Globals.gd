extends Node


var stats: Dictionary = {"profit": 0.1, "public_relations": 0.1, "employee_friendliness": 0.1, "product_quality": 0.1, "environment_indicators": 0.1}
var amount_of_actions: int = 3
var mode: String
var days_since_start: int = 0
enum action_type {placeholder = -1, board = 2, regular = 4}
var texts: Array[Dictionary] = []
