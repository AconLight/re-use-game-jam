extends Node2D

@export var audio:AudioStreamPlayer2D

func poka():
	if visible == false:
		visible = true
		audio.play()
		
func schowaj():
	if visible == true:
		visible = false
		#audio.play()
