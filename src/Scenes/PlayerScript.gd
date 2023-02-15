extends KinematicBody2D

var motion = Vector2.ZERO;
var speed = 300;

func _process(delta):
	var isMoving = false;
	
	if is_on_floor():
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			isMoving = true;
			$AnimatedSprite.play("Run")
		if Input.is_action_pressed("ui_up")	:
			isMoving = true;
			motion.y -= 300;
			$AnimatedSprite.play("Jump")
			
		if !isMoving:
			$AnimatedSprite.play("Idle")
	else:
		motion.y += 10
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0
		
		
	move_and_slide(motion, Vector2.UP)	
