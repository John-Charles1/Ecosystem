extends Node2D

var ballPath = load("res://Mobs/sheep.tscn")

func createBall(mousePosition):
	var newBall = ballPath.instantiate()
	newBall.position = mousePosition
	newBall.position.x += 10
	add_child(newBall)
