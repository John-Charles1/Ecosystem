extends State
class_name Roaming

@export var predator: CharacterBody2D
@export var move_speed := 50.0

var move_direction : Vector2
var wander_time : float

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 3)

func Enter():
	randomize_wander()

func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if predator:
		predator.velocity = move_direction * move_speed
	
	if(predator.test):
		#print("Idle")
		predator.currentState = "Eating"
		Transitioned.emit(self, "eat")
	
	if(predator.breed):
		#print("Idle")
		predator.currentState = "Breeding"
		Transitioned.emit(self, "predBreed")
