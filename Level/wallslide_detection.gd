extends Area2D

class_name WallslideDetection
# Called when the node enters the scene tree for the first time.


func _on_body_entered(body):
	SignalBus.call_deferred("emit_signal", "wallslide_start")


func _on_body_exited(body):
	SignalBus.call_deferred("emit_signal", "wallslide_end")
