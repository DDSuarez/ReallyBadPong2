extends CanvasLayer

@onready var game_screen = preload("res://field.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_one_player_mode_pressed():
	get_tree().change_scene_to_packed(game_screen)


func _on_two_player_mode_pressed():
	pass # Replace with function body.
