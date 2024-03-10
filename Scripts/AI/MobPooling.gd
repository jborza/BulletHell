extends Node2D

var mob_scene: PackedScene = preload("res://Scenes/AI/snake_mob.tscn")
var pool_size: int = 10
var mob_pool : Array = []

@onready var timer = $Timer

func _ready():
	for i in range(pool_size):
		var mob = add_mob()

func get_mob():
	for mob in mob_pool:
		# check if there are any used mobs
		if not mob.visible:
			return mob
			
	return add_mob()
	
func add_mob():
	var mob : Node = mob_scene.instantiate()
	mob.hide()
	mob_pool.append(mob)
	add_child(mob)
	return mob
	
func reset_mob(mob):
	mob.position = Vector2(-1000, -1000)
	mob.isAlive = false
	mob.get_node("CollisionShape2D").disabled = false
	mob.hide()


func _on_timer_timeout():
	var mobTemp = get_mob()
	var randX = randi_range(-50,50)
	var randY = randi_range(-50,50)
	mobTemp.global_position = self.global_position + Vector2(randX,randY)
	mobTemp.show()
