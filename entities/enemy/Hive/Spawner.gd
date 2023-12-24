extends Node


class_name Spawner

@export var spawn_limit : int

func spawn(spawner : Node, enemy : Node, amount : int):
	SignalBus.emit_signal("spawn_enemy", spawner, enemy, amount)
