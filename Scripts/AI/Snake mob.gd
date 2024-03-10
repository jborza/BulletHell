extends CharacterBody2D

var isAlive : bool = true
var speed : int = 20
var health : int = 5

@onready var player = get_node("../../Player")
@onready var sprite = $GuardianSerpentOld
@onready var bar = $ProgressBar
var mob = true

func _ready():
	bar.max_value = health

func _physics_process(delta):
	if isAlive:
		bar.value = health
		var direction = (player.global_position - self.global_position).normalized()
		velocity = speed * direction
		move_and_slide()
		
		if direction.x < 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	else:
		sprite.hide()

func reset_mob(body):
	
	if health > 1:
		health -= 1
	else:
		isAlive = false
		get_parent().reset_mob(body)	
