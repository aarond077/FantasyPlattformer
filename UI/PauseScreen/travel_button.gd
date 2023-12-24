extends Button

class_name TravelButton

@export var travel_scene : String 
@export var obelisk_position : Vector2

@onready var is_active : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if not self.name in SceneLogic.travel_obelisks:
		hide()
	else:
		self.text = travel_scene


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	SceneLogic.reset_dead_enemies()
	SceneLogic.reset_player_health()
	SceneLogic.player_next_init_position = obelisk_position  
	SceneManager.switch_scene(travel_scene)
