extends CharacterBody2D

var speed : int = 75
var direction : Vector2 = Vector2(0,1)

@onready var bullet_pool = $Bullets

func setup_frame_and_fliph(frame: float, flip_h: bool):
	get_node("Player").frame = frame
	get_node("Player").flip_h = flip_h

func _physics_process(delta: float) -> void:
	var inputDir : Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")).normalized()
	if inputDir.x > 0:
		#check if the player is moving right
		setup_frame_and_fliph(1, false)
		direction = inputDir
	elif inputDir.x < 0:
		direction = inputDir
		setup_frame_and_fliph(1, true)
	elif inputDir.y < 0:
		direction = inputDir
		setup_frame_and_fliph(2, false)
	elif inputDir.y > 0:
		direction = inputDir
		setup_frame_and_fliph(0, false)
		
	$SpawnPoint.position =  direction
	
	if Input.is_action_just_pressed("Shoot"):
		var bulletTemp = bullet_pool.get_bullet()
		bulletTemp.velocity = direction * 100
		bulletTemp.global_position = $SpawnPoint.global_position
		bulletTemp.show()
	velocity = inputDir * speed
	move_and_slide()
