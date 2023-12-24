extends Node2D

class_name Level

@export var freeze_slow : float = 0.07
@export var freeze_time : float = 5.9
@export var interaction_bubble_node : PackedScene
 
@onready var player : Player = $Player
@onready var freeze_timer : Timer = $FreezeTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.connect("on_health_changed", on_health_changed)
	SignalBus.connect("spawn_enemy", on_spawn_enemy)
	
	SignalBus.call_deferred("connect", "player_can_interact", on_player_can_interact)
	SignalBus.call_deferred("connect", "player_not_interact", on_player_not_interact)
	update_player_properties()
	
	for child in get_children():
		print(child.name)
	
	update_music(owner.music_name, owner.new_music_name)
	
	update_dead_enemies()

func update_music(music_name : String, new_music_name : String):
	if not MusicManager.find_child(music_name).is_playing():
		MusicManager.play(new_music_name)
		
		
func update_dead_enemies():
	for child in get_children():
		if child.name in SceneLogic.dead_enemies:
			child.queue_free()
		

func _process(delta):
	pass
	

func update_player_properties():
	player.direction.x = 0
	player.position = SceneLogic.player_next_init_position
	player.damageable.health = SceneLogic.player_health
	player.damageable.max_health = SceneLogic.player_max_health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_health_changed(node : Node, amount_changed : int):
	freeze_engine()
	
func on_spawn_enemy(spawner : Node, enemy : Node, amount : int):
	print(amount)
		#spawn_matrix[return_index(spawner, spawners)].append(enemy)
	get_parent().add_child(enemy)

func freeze_engine() -> void:
	Engine.time_scale = freeze_slow
	freeze_timer.start()
	
		
func on_player_can_interact(interaction_name : String):
	var interaction_bubble = interaction_bubble_node.instantiate()

	add_child(interaction_bubble)
	
	
func on_player_not_interact(interaction_name : String):
	for child in get_children():
		if(child.name == "InteractionBubble"):
			child.queue_free()


func _on_freeze_timer_timeout():
	Engine.time_scale = 1
