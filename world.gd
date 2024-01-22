extends Node2D

var rand_x
var rand_y
var timer = 0
var rng = RandomNumberGenerator.new()
@onready var shp = ""
@onready var plant = preload("res://grass.tscn")
var preg = 0
var pos

func _ready():
	pass

func _process(delta):
	rng.randomize()
	rand_x = randi_range(0, 1154)
	rand_y = randi_range(0, 656)
	
	timer += delta
	if(timer >= 1):
		inst(Vector2(rand_x, rand_y))
		print("Asdasdw")
		timer = 0

func inst(pos):
	var instance = plant.instantiate()
	instance.add_to_group("plants")
	instance.position = pos
	add_child(instance)
	
		#if(spawn):
		#print("asdloihj")
		#spawn = false


