extends Node


var spawners : Array[Node]
var spawn_matrix = []

func _ready():
	for node in get_parent().get_children(): #find all nodes in main scene that can spawn enemies then save into spawners array
		if node is CharacterBody2D:
			for child in node.get_children():
				if child is Spawner:
					spawners.append(node)
	for index in range(len(spawners)): #initialising spawn table to monitor which spawner instance spawned which enemies
		spawn_matrix.append([])
#		for y in range(height):
#			spawn_matrix[x].append(0)
					
	for spawner in spawners:
		for child in spawner.get_children():
			if child is Spawner:
				child.connect("spawn_enemy", on_spawn_enemy)
		
func on_spawn_enemy(spawner : Node, enemy : Node, amount : int):
	print(amount)
		#spawn_matrix[return_index(spawner, spawners)].append(enemy)
	get_parent().add_child(enemy)
		#print(get_parent().name)
	
			

func return_index(node : Node, array : Array[Node]) -> int : 
	for index in range(len(array)):
		if node == array[index]:
			return index
	return -1
