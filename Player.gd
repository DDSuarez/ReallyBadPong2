extends StaticBody2D

@onready var screen_size = get_viewport_rect().size
@onready var paddle_size = $ColorRect.get_size()

#var score : int

# Called when the node enters the scene tree for the first time.
func _ready():
	#score = 0
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("down"):
		position.y += get_parent().PADDLE_SPEED * delta
		
	#limit paddle movement to window
	position.y = clamp(position.y, paddle_size.y / 2, screen_size.y - paddle_size.y / 2)
