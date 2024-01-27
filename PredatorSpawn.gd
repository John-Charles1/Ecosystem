extends Node2D

var ballPath = load("res://Mobs/predator.tscn")

func createBall(mousePosition):
	var newBall = ballPath.instantiate()
	newBall.position = mousePosition if (typeof(mousePosition) != TYPE_NIL) else Vector2(0,0) 
	newBall.position.x += 10
	newBall.add_to_group("predator")
	if (typeof(mousePosition) != TYPE_NIL):
		add_child(newBall)
	else:
		pass
