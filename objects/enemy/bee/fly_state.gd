extends State

@onready var state_machine : FiniteStateMachine = get_parent()
var rand_x : float
var rand_y : float
var speed = 50.0
var change_direction : bool = true
var chance : int
@onready var timer : Timer = $Timer
@onready var can_transition : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func state_process(delta):
	if(change_direction):
		timer.start()
		change_direction = false
		chance = randi() % 4
		rand_x = randi() % 2
		rand_y = randi() % 2
		match chance:
			0:
				rand_x *= -1
			1:
				rand_y *= -1
			2:
				rand_x *= -1
				rand_y *= -1
			3:
				pass
		
				
		character.direction = Vector2(rand_x, rand_y)
		change_facing_direction()
	character.velocity = character.direction.normalized() * speed

func enter():
	super.enter()
	can_move = true
	can_transition = false
	animation_player.play("fly")
	
func exit():
	super.enter()
	can_transition = false


func _on_timer_timeout():
	change_direction = true


func _on_player_detection_body_entered(body):
	print("Player entererd")
	if not state_machine.return_current_state().get_state_name() == "Dead":
		
		call_deferred("emit_signal", "interrupt_state", "Follow")


func get_state_name():
	return "Fly"

