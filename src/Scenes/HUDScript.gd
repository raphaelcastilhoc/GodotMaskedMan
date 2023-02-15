extends Control

func _process(delta):
	$CanvasLayer/Label.text = "Fruits: " + str(GlobalVariables.Fruits)
