extends Node

@export var initial_state : State

var current_state : State
var curr
var states : Dictionary = {}

func _ready():
	
	for child in get_children():
		if child is State:
			#print(child.name.to_lower())
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	if initial_state != null:
		initial_state.Enter()
		current_state = initial_state
	#print(current_state)
func _process(delta):
	#if(current_state != null):
		#print("asd")
	#print(current_state != null)
	if(current_state != null):
		current_state.Update(delta)

func _physics_process(delta):
	if(current_state != null):
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if(!new_state):
		return
	
	if(current_state):
		current_state.Exit()
	
	new_state.Enter()
	
	current_state = new_state
