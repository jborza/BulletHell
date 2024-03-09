extends CharacterBody2D

var isAlive : bool = true
var speed : int = 20
@onready var player = get_node("../Player")
@onready var sprite = $GuardianSerpentOld

func _physics_process(delta):
	if isAlive:
		var direction = (player.global_position - self.global_position).normalized()
		velocity = speed * direction
		move_and_slide()
		
		if direction.x < 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
