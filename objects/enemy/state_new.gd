extends Node

class_name StateNew

@onready var debug = owner.find_child("Debug")
@onready var player = owner.get_parent().find_child("Player")
@onready var animation_player = owner.find_child("AnimationPlayer")
@onready var can_move : bool = true

@export var sprite = Sprite2D 
@export var character : CharacterBody2D

signal interrupt_state(new_state : StateNew)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_physics_process(false)

func enter():
	set_physics_process(true)

func exit():
	set_physics_process(false)
	
func transition():
	pass

func state_process(delta):
	pass

func _physics_process(delta):
	transition()

func state_input(event : InputEvent):
	pass
	
func change_facing_direction():
	if character.direction.x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false
func get_state_name():
	pass
