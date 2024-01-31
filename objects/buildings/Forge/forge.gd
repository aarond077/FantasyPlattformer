extends Node2D

@onready var interactable : Interactable = $Interactable


func _ready():
	interactable.call_deferred("connect", "interaction_changed", on_interaction_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_interaction_changed():
	pass
