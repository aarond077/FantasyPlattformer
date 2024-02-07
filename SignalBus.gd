extends Node

signal on_health_changed(node : Node, amount_changed : int)
signal spawn_enemy(spawner : Node, enemy : Node, amount : int)
signal player_interaction()
signal player_interaction_state(player_state : String)
signal player_can_interact(interaction_name : String)
signal player_not_interact(interaction_name : String)
signal active_obelisk(scene_name : String, position : Vector2)
signal save_game(save_position : Vector2)
signal load_game()
signal wallslide_start()
signal wallslide_end()
#signal spawn_limit_changed(node : Node, amount_changed : int)
