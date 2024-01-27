extends Node2D

var score := [0, 0] # 0:Player, 1: CPU
const PADDLE_SPEED: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("spawn"):
		$Ball.new_ball()


func _on_ball_timer_timeout():
	$Ball.new_ball()


func _on_score_left_body_entered(body):
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$BallTimer.start()

func _on_score_right_body_entered(body):
	score[0] += 1
	$HUD/PlayerScore.text = str(score[0])
	$BallTimer.start()
