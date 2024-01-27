extends Node2D

@onready var screen_size = get_viewport_rect().size

const PADDLE_SPEED: int = 500

#var score := [0, 0] # 0:Player, 1: CPU

var ballCounter

var ballScene = preload("res://ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ballCounter = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("spawn"):
		var newBall = ballScene.instantiate()
		newBall.position.x = screen_size.x / 2
		newBall.position.y = randi_range(200, screen_size.y - 200)
		newBall.speed = newBall.START_SPEED
		newBall.dir = newBall.random_direction()
		add_child(newBall)
		ballCounter += 1
	if Input.is_action_just_pressed("rave"):
		$Background.set_color(Color(randf_range(0, 1), randf_range(0, 1), randf_range(0, 1), randf_range(0, 1)))

	print(ballCounter)

func _on_ball_timer_timeout():
	$Ball.new_ball()
	ballCounter += 1


func _on_score_left_body_entered(body):
	$CPU.score += 1
	$HUD/CPUScore.text = str($CPU.score)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()

func _on_score_right_body_entered(body):
	$Player.score += 1
	$HUD/PlayerScore.text = str($Player.score)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()
