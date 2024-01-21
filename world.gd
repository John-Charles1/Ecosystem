extends Node2D

var rand_x
var rand_y
var timer = 0
var rng = RandomNumberGenerator.new()

@onready var plant = preload("res://grass.tscn")

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

func inst(pos):
	var instance = plant.instantiate()
	instance.position = pos
	add_child(instance)
