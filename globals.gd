extends Node

var playerScore : int
var cpuScore : int
var player2Mode : bool
var wrap : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	playerScore = 0
	cpuScore = 0
	player2Mode = false
	wrap = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
