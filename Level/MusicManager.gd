extends Node

@onready var lichtung_track : AudioStreamPlayer = $Lichtung

# Called when the node enters the scene tree for the first time.
func _ready():
	print("lichtung")
	lichtung_track.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
