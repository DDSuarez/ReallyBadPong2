extends Node2D

@onready var end_screen = preload("res://end_screen.tscn")

@onready var screen_size = get_viewport_rect().size

const PADDLE_SPEED : int = 500
const WIN_SCORE : int = 5

var ballCounter : int
var charScale : Vector2

var ballScene = preload("res://ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ballCounter = 0
	charScale = Vector2(1,1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jam"):
		jamOut()
		
	if Score.player >= WIN_SCORE or Score.cpu >= WIN_SCORE:
		get_tree().change_scene_to_packed(end_screen)
		
func jamOut():
	var jam = randi_range(1,4)
	#var jam = 4
	
	match jam:
		1:
			# spawn a new ball
			var newBall = ballScene.instantiate()
			newBall.position.x = screen_size.x / 2
			newBall.position.y = randi_range(200, screen_size.y - 200)
			newBall.speed = newBall.START_SPEED
			newBall.dir = newBall.random_direction()
			add_child(newBall)
			ballCounter += 1
		2:
			# change the background color randomly
			$Background.set_color(Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1), randf_range(0, 1)))
		3:
			# make the characters smaller, but not too small
			if charScale > Vector2(0.03125, 0.03125):
				charScale /= 2
				$Player.scale = charScale
				$CPU.scale = charScale
				$Ball.scale = charScale
		4:
			# make the characters bigger, but not too big
			if charScale < Vector2(32, 32):
				charScale *= 2
				$Player.scale = charScale
				$CPU.scale = charScale
				$Ball.scale = charScale
		_:
			pass
			

func _on_ball_timer_timeout():
	$Ball.new_ball()
	ballCounter += 1


func _on_score_left_body_entered(body):
	Score.cpu += 1
	$HUD/CPUScore.text = str(Score.cpu)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()

func _on_score_right_body_entered(body):
	Score.player += 1
	$HUD/PlayerScore.text = str(Score.player)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()
