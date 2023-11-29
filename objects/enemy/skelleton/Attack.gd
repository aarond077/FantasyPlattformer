extends State

@export var sword : Area2D 
@export var can_transition : bool = false

@onready var timer : Timer = $Timer

func ready():
	character.direction = player.position - character.position
# Called when the node enters the scene tree for the first time.
func enter():
	super.enter()
	can_transition = false
	can_move = false
	timer.start()
	animation_player.play("attack")
	
func state_process(delta):
	character.direction = player.position - character.position
	if character.direction.x < 0 :
		sprite.flip_h = true

func transition():
	if character.direction.length() > 50 and can_transition:
		get_parent().change_state("Follow")

func exit():
	super.exit()
	sword.monitoring = false #sword wont hit outside attack state
	can_transition = false



func _on_timer_timeout():
	can_transition = true

func return_state_name():
	return "SkelletonAttack"
