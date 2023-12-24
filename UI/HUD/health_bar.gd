extends Control

@onready var progress_bar : TextureProgressBar = $TextureProgressBar
# Called when the node enters the scene tree for the first time.
func set_health(amount : float):
	progress_bar.value = amount

func get_health():
	return progress_bar.value
