extends Node2D  

@export var drzwi: Node2D


func _ready():
	var target_position = drzwi.global_position

	var tween := create_tween()
	tween.tween_property(
		self,
		"global_position",
		target_position,
		1.0
	)
