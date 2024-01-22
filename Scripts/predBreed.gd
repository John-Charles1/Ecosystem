extends State
class_name predBreed

@export var enemy : CharacterBody2D
@export var move_speed := 40.0
@onready var player : CharacterBody2D
var chase

func Update(delta: float):
	player = enemy.player1 if enemy.player1 != null else null
	chase = enemy.breed
	#print(true)

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position if player != null else enemy.global_position
	var time = 0
	if(enemy.breed):
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2(0,0)

	if(!enemy.breed):
		#print("follow")
		enemy.currentState = "Roaming"
		Transitioned.emit(self, "Roaming")
