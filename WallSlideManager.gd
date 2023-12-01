extends Node2D

class_name WallslideManager
signal wallslide()
signal wallslide_end()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_wallslide_detection_body_entered(body):
	print("hooray")
	call_deferred("emit_signal", "wallslide")


func _on_wallslide_detection_body_exited(body):
	call_deferred("emit_signal", "wallslide_end")


func _on_wallslide_detection_2_body_entered(body):
	pass # Replace with function body.
