extends CharacterBody2D
class_name DinoEnemy

var player1
@onready var test = false

func _physics_process(delta):
	##enemy.velocity = move_direction * move_speed
	#var move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	#velocity = move_direction * 65.0
	
	if(velocity.length() > 0):
		get_node("AnimatedSprite2D").play("Run")
	
	if(velocity.x > 0):
		get_node("AnimatedSprite2D").flip_h = false
	else:
		get_node("AnimatedSprite2D").flip_h = true
	move_and_slide()



func _on_area_2d_body_entered(body):
	if(body != self and body != $"../StaticBody2D"):
		test = true
		player1 = body
		print(body.name+"en")



func _on_area_2d_body_exited(body):
	test = false
	player1 = body
	print(body.name+"ex")


func _on_eat_body_entered(body):
	if(body != self):
		body.queue_free()
		test = false
