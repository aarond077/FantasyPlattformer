extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var default_init_animation_name : String = "default_init"
@onready var player : Player = get_parent().find_child("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play(default_init_animation_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = player.position + Vector2(10, -30)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == default_init_animation_name:
		animation_player.play("default_interaction")
