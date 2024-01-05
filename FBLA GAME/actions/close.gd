extends VBoxContainer


signal close(type)

func _on_button_button_down():
	close.emit("close")
