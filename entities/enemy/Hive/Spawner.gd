extends Node


class_name Spawner

@export var spawn_limit : int

signal spawn_enemy(spawner : Node, enemy : Node, amount : int)

func spawn(spawner : Node, enemy : Node, amount : int):
	emit_signal("spawn_enemy", spawner, enemy, amount)
