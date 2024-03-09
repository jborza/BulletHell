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
		get_node("Player").frame = 1
		get_node("Player").flip_h = false
		direction = inputDir
	elif inputDir.x < 0:
		direction = inputDir
		get_node("Player").frame = 1
		get_node("Player").flip_h = true
	elif inputDir.y < 0:
		direction = inputDir
		get_node("Player").frame = 2
		get_node("Player").flip_h = false
	elif inputDir.y > 0:
		direction = inputDir
		get_node("Player").frame = 0
		get_node("Player").flip_h = false
		
	velocity = inputDir * speed
	move_and_slide()
