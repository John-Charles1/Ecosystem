extends Node2D

var ballPath = load("res://Mobs/sheep.tscn")
var spawn = false

func _physics_process(delta):
	if(spawn):
		print("asdloihj")
		createBall(get_global_mouse_position())
		spawn = false

func createBall(mousePosition):
	var newBall = ballPath.instantiate()
	newBall.set_position(mousePosition)
	add_child(newBall)
