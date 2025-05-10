extends AnimatedSprite2D

@export var sound:AudioStreamPlayer2D

func _process(delta):
	if is_playing():
		if !sound.playing:
			sound.play()
	else:
		if sound.playing:
			sound.stop()
