extends CharacterBody2D

@onready var screen_size = get_viewport_rect().size

const START_SPEED : int = 600
const ACCEL : int = 50
const MAX_Y_VECTOR : float = 0.6

var speed : int
var dir : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		$AudioStreamPlayer2D.play()
		collider = collision.get_collider()
		#if ball hits paddle
		if collider == $"../Player" or collider == $"../CPU":
			speed += ACCEL
			dir = new_direction(collider)
		#if it hits the wall
		else:
			dir = dir.bounce(collision.get_normal())

func new_ball():
	#randomize start position and direction
	position.x = screen_size.x / 2
	position.y = randi_range(200, screen_size.y - 200)
	speed = START_SPEED
	dir = random_direction()
	
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)
	return new_dir.normalized()
	
func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	#flip the horizontal direction
	if dir.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist / (collider.paddle_size.y / 2)) * MAX_Y_VECTOR
	return new_dir.normalized()
		
