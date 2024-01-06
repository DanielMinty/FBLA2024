extends CharacterBody2D


const SPEED = 500


func _process(_delta):
	# Movement
	var direction_x = Input.get_axis("left", "right")
	velocity.x = direction_x * SPEED
	move_and_slide()
	
	# add up arrow functionality 
	
