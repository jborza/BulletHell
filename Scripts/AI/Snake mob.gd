extends CharacterBody2D

var isAlive : bool = true
var speed : int = 20
var health : int = 5

@onready var player = get_node("../../Player")
@onready var sprite = $GuardianSerpentOld
@onready var bar = $ProgressBar
@onready var anim = $Anim
@onready var bullet_pool= $Bullets
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
			$SpawnPoint.position = Vector2(-10, -11)
		else:
			sprite.flip_h = true
			$SpawnPoint.position = Vector2(10, -11)
	else:
		sprite.hide()
		bar.hide()
		anim.show()

func reset_mob(body):
	
	if health > 1:
		health -= 1
	else:
		isAlive = false
		anim.play("Death")
		await anim.animation_finished
		get_parent().reset_mob(body)	


func _on_player_detection_body_entered(body):
	if "Player" in body.name:
		if visible and body.visible:
			Game.playerHP -= 1


func _on_timer_timeout():
	shoot_bullet()
	
func shoot_bullet():
	if self.visible:
		var bulletTemp = bullet_pool.get_bullet()
		var direction = (player.global_position - self.global_position).normalized()
		bulletTemp.velocity = direction * 100
		bulletTemp.global_position = $SpawnPoint.global_position
		bulletTemp.show()
