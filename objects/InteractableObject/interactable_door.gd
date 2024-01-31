extends InteractableObject
class_name InteractableDoor

@export var scene_change_detection_name : String

@onready var scene_change_detection : SceneChangeDetection = get_parent().find_child(scene_change_detection_name)


# Called when the node enters the scene tree for the first time.
func _ready():
	interactable.call_deferred("connect", "interaction_changed", on_interaction_changed)




func on_interaction_changed():
	print("hello")
	scene_change_detection.monitoring = true
