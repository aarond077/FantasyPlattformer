extends Node
class_name SceneChangeDetection
@export var player_next_init_position : Vector2
@export var travel_scene : String

@onready var player : Player = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body): #player properties gets loaded between scenes
	SceneLogic.store_player_properties(
		player_next_init_position,
		player.damageable.health,
		player.damageable.max_health
	)
	SceneManager.switch_scene(travel_scene)
