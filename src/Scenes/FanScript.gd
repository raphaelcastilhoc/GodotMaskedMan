extends Area2D


func _process(delta):
	$AnimatedSprite.play("Spinning")


func _on_Area2D_body_entered(body):
	if(body.name ==  "Player"):
		get_tree().reload_current_scene()
