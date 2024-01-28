extends StaticBody2D

const CPU_SPEED : int = 500

@onready var screen_size = get_viewport_rect().size
@onready var paddle_size = $ColorRect.get_size()

var ball_pos : Vector2
var dist : int
var move_by : int
var newSpeed : int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.player2Mode:
		if Input.is_action_pressed("p2_up"):
			position.y -= get_parent().PADDLE_SPEED * delta
		elif Input.is_action_pressed("p2_down"):
			position.y += get_parent().PADDLE_SPEED * delta
	else:		
		#move paddle towards ball
		ball_pos = $"../Ball".position
		dist = position.y - ball_pos.y
		newSpeed = randi_range(200, CPU_SPEED)
		
		if abs(dist) > newSpeed * delta:
			move_by = newSpeed * delta * (dist / abs(dist)) # gives a sign to the move_by variable to see if the ball is above or below
		else:
			move_by = dist
		
		position.y -= move_by
	
	if Globals.wrap:
		# wrap the paddle vertically
		position.y = wrapf(position.y, 0, screen_size.y)
	else:
		# limit paddle movement to window. the default behavior.
		position.y = clamp(position.y, paddle_size.y / 2, screen_size.y - paddle_size.y / 2)
	
