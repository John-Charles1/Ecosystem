extends Node2D

var rand_x
var rand_y
var timer = 0
var rng = RandomNumberGenerator.new()
@onready var shp = ""
@onready var plant = preload("res://grass.tscn")
var preg = 0
var pos
var ballPath = load("res://Mobs/sheep.tscn")

func _ready():
	pass

func _process(delta):
	rng.randomize()
	rand_x = randi_range(0, 1000)
	rand_y = randi_range(0, 1000)
	
	timer += delta
	if(timer >= 1):
		inst(Vector2(rand_x, rand_y))
		print("Asdasdw")
		timer = 0
	while(preg > 0):
		createBall(pos)
		preg -= 1

func inst(pos):
	var instance = plant.instantiate()
	instance.position = pos
	add_child(instance)
	
		#if(spawn):
		#print("asdloihj")
		#spawn = false

func createBall(mousePosition):
	var newBall = ballPath.instantiate()
	newBall.position = mousePosition
	add_child(newBall)
