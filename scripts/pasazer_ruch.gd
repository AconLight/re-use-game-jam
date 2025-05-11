extends Node2D  

@export var przystanek: Node2D
@onready var animated_sprite = $AnimatedSprite2D 
# Reference to the AnimatedSprite node

func wsiadac():
	animated_sprite.play("default")  # Replace "default" with the name of
	# Tween movement to the target position
	# TODO STEFAN
	var target_position = przystanek.get_drzwi().global_position
	var tween := create_tween()
	tween.tween_property(
		self,
		"global_position",
		target_position,
		1.0
		)
	tween.tween_callback(Callable(self,"queue_free"))


func _on_przystanek_wsiadac() -> void:
	pass # Replace with function body.
