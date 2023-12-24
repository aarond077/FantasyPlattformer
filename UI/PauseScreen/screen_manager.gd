extends Control

@onready var pause_screen : Control = $PauseScreen
@onready var world_screen : Control = $WorldScreen
@onready var world_view : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event : InputEvent)-> void:
	if event.is_action_pressed("ui_cancel") and not world_view:
		pause_screen.visible = not pause_screen.visible
	elif event.is_action_pressed("ui_cancel") and world_view:
		world_view = false
		world_screen.visible = not world_screen.visible

func _on_world_button_pressed():
	world_view = true
	pause_screen.hide()
	world_screen.show()


func _on_exit_pressed():
	world_view = false
	pause_screen.show()
	world_screen.hide()
