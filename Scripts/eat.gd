extends State
class_name eat

@export var enemy : CharacterBody2D
@export var move_speed := 40.0
@onready var player : CharacterBody2D
var chase = false

#func Enter():
	##player = get_tree().get_first_node_in_group("Player")
	##for i in range(5):
		##print(get_tree().get_nodes_in_group("Player")[i] == player)
#
##func Process(delta):
	#player = enemy.player1

func Update(delta: float):
	player = enemy.player1 if enemy.player1 != null else null
	chase = enemy.test
	#print(true)

func Physics_Update(delta: float):
	var direction = player.global_position - enemy.global_position if player != null else enemy.global_position
	var time = 0
	if(enemy.test):
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2(0,0)

	if(!enemy.test):
		#print("follow")
		enemy.currentState = "Roaming"
		Transitioned.emit(self, "Roaming")
	
	

