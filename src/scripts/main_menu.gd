extends CanvasLayer

var game_screen : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func load_game():
	game_screen = load("res://src/scenes/field.tscn")
	get_tree().change_scene_to_packed(game_screen)


func _on_one_player_mode_pressed():
	Globals.player2Mode = false
	load_game()


func _on_two_player_mode_pressed():
	Globals.player2Mode = true
	load_game()
	
