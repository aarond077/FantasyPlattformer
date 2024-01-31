extends State


@onready var can_transition : bool = false
@onready var can_turn : bool = false
@onready var speed : float = 20.0
@export var damageable : Damageable

@onready var turn_timer : Timer = $TurnTimer
@onready var chance : int


func _ready():
	randomize()

func enter():
	super.enter()
	turn_timer.start()
	can_transition = false
	animation_player.play("walk")
	
func exit():
	super.exit()
	can_transition = false
	
	

func transition():
	super.transition()
	if can_transition:
		call_deferred("emit_signal", "interrupt_state", "Attack")
		
func state_process(delta):
	if can_turn:
		character.direction = Vector2.RIGHT
	else:
		character.direction = Vector2.LEFT
	character.velocity.x = character.direction.normalized().x * speed
	
func get_state_name():
	return "Walk"


func _on_player_detection_body_entered(body):
	if damageable.health > 0:
		can_transition = true


func _on_turn_timer_timeout():
	chance = randi() % 3
	if chance > 0:
		can_turn = true
	elif chance == 0:
		can_turn = false
	turn_timer.start()
	print(chance)
