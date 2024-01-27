extends Node2D

var rand_x
var rand_y
var timer = 0
var rng = RandomNumberGenerator.new()
@onready var shp = ""
@onready var plant = preload("res://grass.tscn")
var preg = 0
var pos
var plant_count = 0

#procedural generation terrain
@onready var tile_map = $TileMap

const MAP_SIZE = Vector2(1154, 656)
const LAND_CAP = 0.3

func _ready():
	#generate_world()
	print("generate")

func _process(delta):
	rng.randomize()
	rand_x = randi_range(0, 1154)
	rand_y = randi_range(0, 656)
	
	timer += delta
	if(timer >= 1 && plant_count < 20):
		inst(Vector2(rand_x, rand_y))
		#print("Asdasdw")
		timer = 0

func inst(pos):
	var instance = plant.instantiate()
	instance.add_to_group("plants")
	instance.position = pos
	add_child(instance)
	plant_count+=1
	
		#if(spawn):
		#print("asdloihj")
		#spawn = false

func generate_world():
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	
	var cells = []
	for x in MAP_SIZE.x:
		for y in MAP_SIZE.y:
			var a = noise.get_noise_2d(x, y) 
			if a < LAND_CAP:
				cells.append(Vector2(x, y))
	
	tile_map.set_cells_terrain_connect(0, cells, 0, 0)
