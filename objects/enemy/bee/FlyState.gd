extends State

class_name FlyState

@onready var rng = RandomNumberGenerator.new()
@onready var direction : float
@export var state_machine : CharacterStateMachine
@export var bee : CharacterBody2D 
@export var starting_move_direction : Vector2 = Vector2.LEFT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = rng.randf_range(0.0, 1.0)
	print(direction)
	
	
