extends CharacterBody2D
class_name DinoEnemy

var player1
@onready var test = false
@onready var breed = false
var currentState = "Roaming"
var health = 20
var gender = false
var child_pos

func _ready():
	gender = randi() % 2 == 0

func _physics_process(delta):
	##enemy.velocity = move_direction * move_speed
	#var move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	#velocity = move_direction * 65.0
	prevent_sheep_from_crossing_the_border()
	flip_sheep_and_run()
	move_and_slide()


func prevent_sheep_from_crossing_the_border():
	if(self.global_position.x > 1154):
		velocity = Vector2(0,0)
		self.global_position.x = 1153
	elif(self.global_position.x < 0):
		velocity = Vector2(0,0)
		self.global_position.x = 1
	elif(self.global_position.y > 656):
		velocity = Vector2(0,0)
		self.global_position.y = 655
	elif(self.global_position.y < 0):
		velocity = Vector2(0,0)
		self.global_position.y = 1

func flip_sheep_and_run():
	if(velocity.length() > 0):
		get_node("AnimatedSprite2D").play("Run")

	if(velocity.x > 0):
		get_node("AnimatedSprite2D").flip_h = false
	else:
		get_node("AnimatedSprite2D").flip_h = true


func _on_area_2d_body_entered(body):
	if(!body.is_in_group("Sheep") and body != $"../StaticBody2D" and body != $"../water" and health <= 15):
		test = true
		player1 = body
		print(body.name+"en")
	elif(body.is_in_group("Sheep") and body != $"../StaticBody2D" and body != $"../water" and health > 15 and body != self):
		breed = true
		player1 = body
		print(body.name+"en breed")


func _on_area_2d_body_exited(body):
	if(health <= 15):
		test = false
		player1 = body
		print(body.name+"ex")
	elif(health > 15):
		breed = false
		player1 = body
		print(body.name+"ex breed")


func _on_eat_body_entered(body):
	if(!body.is_in_group("Sheep") and body != $"../water" and health <= 15):
		health += 15
		body.queue_free()
		test = false
	elif(body.is_in_group("Sheep") and body != $"../water" and health > 15):
		breed = false
		$Pregnant.start()
		child_pos = body.global_position
		print("bred")


func _on_pregnant_timeout():
		#$"../..".preg+=1
		$"../..".pos = child_pos
