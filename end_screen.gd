extends CanvasLayer

#var main_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.playerScore >= 10:
		if !Globals.player2Mode:
			$Winner.set_text("Player won")
		else:
			$Winner.set_text("Player 1 won")
	else:
		if !Globals.player2Mode:
			$Winner.set_text("CPU won")
		else:
			$Winner.set_text("Player 2 won")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_restart_button_pressed():
	Globals.playerScore = 0
	Globals.cpuScore = 0
	var main_menu = load("res://main_menu.tscn")
	get_tree().change_scene_to_packed(main_menu)
