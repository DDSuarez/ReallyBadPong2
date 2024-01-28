extends Node2D

@onready var end_screen = preload("res://end_screen.tscn")

@onready var screen_size = get_viewport_rect().size

const PADDLE_SPEED : int = 500
const WIN_SCORE : int = 10

var ballCounter : int
var charScale : Vector2
var p1Jammed : bool
var p2Jammed : bool

#var ballScene = preload("res://ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	ballCounter = 0
	charScale = Vector2(1,1)
	p1Jammed = false
	p2Jammed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("p1_jam"):
		p1Jammed = true
		p2Jammed = false
		jamOut()
	elif Input.is_action_just_pressed("p2_jam"):
		p1Jammed = false
		p2Jammed = true
		jamOut()
		
	if Globals.playerScore >= WIN_SCORE or Globals.cpuScore >= WIN_SCORE:
		get_tree().change_scene_to_packed(end_screen)
		
func jamOut():
	var jam = randi_range(1,9)
	#var jam = 8
	
	match jam:
		1:
			# spawn a new ball
			var ballScene = load("res://ball.tscn")
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
		5:
			# turn screen wrap on/off
			Globals.wrap = !Globals.wrap
			$WrappedIndicator.visible = Globals.wrap
		6:
			# increase ball speed
			$Ball.speed += $Ball.ACCEL
		7:
			# decrease ball speed
			$Ball.speed -= $Ball.ACCEL
		8:
			# launches a fast ball from the paddle across the screen
			var ballScene = load("res://ball.tscn")
			var newBall = ballScene.instantiate()
			newBall.speed = 1000
			
			var new_dir := Vector2()
			new_dir.y = 0
			
			if p1Jammed:
				newBall.position.x = $Player.position.x + 60
				newBall.position.y = $Player.position.y
				new_dir.x = 1
			elif p2Jammed:
				newBall.position.x = $CPU.position.x - 60
				newBall.position.y = $CPU.position.y
				new_dir.x = -1
			
			newBall.dir = new_dir
			add_child(newBall)
			ballCounter += 1
		9:
			$AudioStreamPlayer2D.play()
		_:
			pass
			
	p1Jammed = false
	p2Jammed = false
			

func _on_ball_timer_timeout():
	$Ball.new_ball()
	ballCounter += 1


func _on_score_left_body_entered(body):
	Globals.cpuScore += 1
	$HUD/CPUScore.text = str(Globals.cpuScore)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()

func _on_score_right_body_entered(body):
	Globals.playerScore += 1
	$HUD/PlayerScore.text = str(Globals.playerScore)
	ballCounter -= 1
	if ballCounter == 0:
		$BallTimer.start()
