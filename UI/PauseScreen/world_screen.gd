extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalBus.call_deferred("connect", "active_obelisk", on_active_obelisk)
	hide()
	
	for child in get_child(0).get_child(0).get_children():
		if child.name in SceneLogic.travel_obelisks:
			child.text = child.name
			child.show()
	
func on_active_obelisk(scene_name : String, position : Vector2):
	for child in get_child(0).get_child(0).get_children(): #find button for traveling
		if child.name == scene_name:
			child.text = scene_name
			child.show()
			#child.obelisk_position = obelisk_position
