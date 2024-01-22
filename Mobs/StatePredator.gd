extends Label

var gnder

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Idle"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gnder = "male" if $"..".gender else "female"
	text = str($"..".currentState+'\n'+gnder+"\nBreed Drive: "+str($"..".breed_drive))
