extends Camera2D

@export var sprite : Sprite2D
@export var player : CharacterBody2D 

var screen_width = get_viewport_rect().size.x
var camera_target
var target_distance = 20
var camera_speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
#	if !sprite.flip_h :
#		camera_target = player.position.x + target_distance - screen_width/4
#		offset.x = min(offset.x + delta, camera_target)
#	else:
#		camera_target = player.position.x - target_distance - screen_width/4
#		offset.x = max(offset.x - camera_target, camera_target)
		offset.y = player.position.y - 250
