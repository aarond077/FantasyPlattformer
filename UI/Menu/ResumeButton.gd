extends Button



# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	SignalBus.call_deferred("emit_signal", "load_game")
	SceneManager.switch_scene("Lichtung1")
