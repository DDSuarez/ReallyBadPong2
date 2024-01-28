extends CanvasLayer

@onready var main_menu = preload("res://main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if Score.player >= 3:
		$Winner.set_text("Player won")
	else:
		$Winner.set_text("CPU won")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setPlayerWin():
	$Winner.set_text("Player won")
	
func setCPUWin():
	$Winner.set_text("CPU won")

func _on_restart_button_pressed():
	get_tree().change_scene_to_packed(main_menu)
