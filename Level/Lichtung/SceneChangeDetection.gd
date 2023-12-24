extends Area2D

@onready var player : Player = $"../Player"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	SceneLogic.store_player_properties(
		Vector2(47, 143),
		player.damageable.health,
		player.damageable.max_health
		
	)
	SceneManager.switch_scene("Lichtung2")
