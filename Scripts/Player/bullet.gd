extends CharacterBody2D

func _process(delta):
	self.rotation += 1
	move_and_slide()


func _on_area_2d_body_entered(body):
	# which body is it?
	if body.get("mob"):
		if body.isAlive and body.visible and self.visible:
			body.reset_mob(body)
			get_parent().reset_bullet(self)
			
