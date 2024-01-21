extends ProgressBar

const MAX_HEALTH = 20
var timer = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	set_health_label()

func set_health_label() -> void:
	$"../Health".text = "Health: %s" % $"..".health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if(timer > 2.0):
		$"..".health-=1
		timer = 0
	
	if($"..".health <= 0):
		$"..".queue_free()
	set_health_label()
