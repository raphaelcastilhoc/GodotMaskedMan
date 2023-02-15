extends KinematicBody2D

var motion = Vector2.ZERO;
const gravity = 10;
var speed = 200;
var is_moving_left = true;

func _ready():
	$AnimatedSprite.play("Idle")

func _process(delta):
	if $AnimatedSprite.animation == "Run":
		move()
	
	detect_turn_around()

func move():
	motion.x = -speed if is_moving_left else speed
	motion.y += gravity
	
	move_and_slide(motion, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func _on_PlayerViewDetector_body_entered(body):
	if body.name == "Player":
		$AnimatedSprite.play("Run")

func _on_PlayerViewDetector_body_exited(body):
	if body.name == "Player":
		$AnimatedSprite.play("Idle")

func _on_PlayerDetector_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
