extends Node2D

var ballPath = load("res://Mobs/predator.tscn")

func createBall(mousePosition):
	var newBall = ballPath.instantiate()
	newBall.position = mousePosition
	newBall.position.x += 10
	add_child(newBall)
