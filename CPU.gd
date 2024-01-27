extends StaticBody2D

@onready var screen_size = get_viewport_rect().size
@onready var paddle_size = $ColorRect.get_size()

var ball_pos : Vector2
var dist : int
var move_by : int
var score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move paddle towards ball
	ball_pos = $"../Ball".position
	dist = position.y - ball_pos.y
	
	if abs(dist) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (dist / abs(dist)) # gives a sign to the move_by variable to see if the ball is above or below
	else:
		move_by = dist
	
	position.y -= move_by
	
	#limit paddle movement to window
	position.y = clamp(position.y, paddle_size.y / 2, screen_size.y - paddle_size.y / 2)
