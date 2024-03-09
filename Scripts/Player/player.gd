extends CharacterBody2D

var speed : int = 75
var direction : Vector2 = Vector2(0,1)

func _physics_process(delta: float) -> void:
	var inputDir : Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()
	print(inputDir)
	
	if inputDir.x > 0:
		#check if the player is moving right
		direction = inputDir
	elif inputDir.x < 0:
		direction = inputDir
	elif inputDir.y < 0:
		direction = inputDir
	elif inputDir.y > 0:
		direction = inputDir
		
	velocity = inputDir * speed
	move_and_slide()
