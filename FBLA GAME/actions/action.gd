extends VBoxContainer


# Supposed to be {"stat" (String): impact (float), ...}. Example: {"profit": 0.1}
var impacted_stats: Dictionary = {}
signal close(type)


func _on_button_button_down():
	for stat in impacted_stats:
		var impact = impacted_stats[stat]
		Globals.stats[stat] += impact
	close.emit("stat")

