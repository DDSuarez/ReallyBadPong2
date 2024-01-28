extends StaticBody2D

@onready var screen_size = get_viewport_rect().size
@onready var paddle_size = $ColorRect.get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("p1_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("p1_down"):
		position.y += get_parent().PADDLE_SPEED * delta
		
	if Globals.wrap:
		# wrap the paddle vertically
		position.y = wrapf(position.y, 0, screen_size.y)
	else:
		# limit paddle movement to window. the default behavior.
		position.y = clamp(position.y, paddle_size.y / 2, screen_size.y - paddle_size.y / 2)
