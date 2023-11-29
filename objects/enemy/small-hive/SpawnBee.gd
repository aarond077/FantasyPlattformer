extends State
var can_transition : bool = false
@export var bee_node : PackedScene
@export var spawner : Spawner

@onready var bees_spawned : int = 0 #counter for bee_limit
@onready var spawn_manager : CharacterBody2D = get_parent().find_child("SpawnManager") 

func enter():
	super.enter()
	can_move = false
	can_transition = false
	animation_player.play("spawn")

func exit():
	can_transition = false

func transition():
	super.transition()
	if can_transition:
		get_parent().change_state("Hang")

func state_process(delta):
	super.state_process(delta)


func get_state_name():
	super.get_state_name()
	return "Spawn"

func spawn_bee():
	if(bees_spawned < spawner.spawn_limit):
		var bee = bee_node.instantiate()
		bee.position = owner.position + Vector2(20, 0)
		bee.connect("spawn_limit_changed", on_spawn_limit_changed)
		spawner.spawn(owner, bee, 1)
		bees_spawned += 1

func toggle_can_transition():
	can_transition = true

func on_spawn_limit_changed():
	bees_spawned = 0
	
