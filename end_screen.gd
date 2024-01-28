extends CanvasLayer

#var main_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.player >= 3:
		$Winner.set_text("Player won")
	else:
		$Winner.set_text("CPU won")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_restart_button_pressed():
	Score.player = 0
	Score.cpu = 0
	var main_menu = load("res://main_menu.tscn")
	get_tree().change_scene_to_packed(main_menu)
