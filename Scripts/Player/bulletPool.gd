extends Node

var bullet_scene: PackedScene = preload("res://Scenes/Player/bullet.tscn")
var pool_size: int = 10
var bullet_pool : Array = []

func _ready():
	for i in range(pool_size):
		var bullet = add_bullet()

func get_bullet():
	for bullet in bullet_pool:
		# check if there are any used bullets
		if not bullet.visible:
			return bullet
			
	return add_bullet()
	
func add_bullet():
	var bullet : Node = bullet_scene.instantiate()
	bullet.hide()
	bullet_pool.append(bullet)
	add_child(bullet)
	return bullet
	
func reset_bullet(bullet):
	bullet.position = Vector2(-1000, -1000)
	bullet.hide()
