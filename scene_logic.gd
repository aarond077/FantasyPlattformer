extends Node

@export var last_scene_name : String
@export var player : Player
@export var player_next_init_position : Vector2
@export var player_health : float
@export var player_max_health : float
@export var player_speed : float

@export var last_save_scene_name : String

@export var travel_obelisks : Array[String]


@export var dead_enemies : Array[String]

var game_state_file = "user://savedgame1.sav"
var password : String = "12345"


func store_player_properties(
	next_init_position : Vector2, 
	health : float,
	max_health : float,
) -> void:
	self.player_next_init_position = next_init_position
	self.player_health = health
	self.player_max_health = max_health

func store_scene_properties(
	new_scene_name : String,
	new_travel_obelisks : Array[String]
) -> void:
	self.last_save_scene_name = new_scene_name
	self.travel_obelisks = new_travel_obelisks
	

func reset_dead_enemies():
	var new_dead_enemies : Array[String]
	self.dead_enemies = new_dead_enemies
	
func reset_player_health():
	self.player_health = player_max_health
	
func reset_game():
	store_player_properties(
		Vector2(400, 295),
		120,
		120
	)
	reset_dead_enemies()
	
	
func on_save_game():
	pass
	
func on_load_game():
	pass
	
		
# Serialize the object's properties and write them to the given file
func serialize(file : FileAccess) -> void:
	file.store_pascal_string(last_save_scene_name)    # Store a string
	#file.store_32(damageable.health)             # Store a 32-bit integer
	file.store_float(player_speed)           # Store a 32-bit float
	file.store_float(player_max_health)  
	
# Read the object's properties from the given file and deserialize them
func deserialize(file : FileAccess) -> void:
	last_save_scene_name = file.get_pascal_string()   # Get a string
	player_max_health = file.get_32()            # Get a 32-bit integer
	player_speed = file.get_float()          # Get a 32-bit float
	
# Save the object's properties to the file
func _on_button_save_game_pressed():
	var status = SaveLoadModule.open_file(FileAccess.WRITE)  # Open the file with a write access
	if (status != OK):  
		print("Unable to open the file %s. Received error: %d" % [game_state_file, status])
		return
	SaveLoadModule.serialize(self)              # Write the object's properties into the file
	SaveLoadModule.close_file()                  # Close the file
 
# Load the object's properties from the file
func _on_button_load_game_pressed():
	var status = SaveLoadModule.open_file(FileAccess.READ)   # Open the file with a read access
	if (status != OK):
		print("Unable to open the file %s. Received error: %d" % [game_state_file, status])
		return
		
	SaveLoadModule.deserialize(self)            # Read data from the file and update the object's properties
	SaveLoadModule.close_file()       
	


	
func _ready():
	SaveLoadModule.initialize(game_state_file, password)
	self.player_max_health = 120
	self.player_health = 120
