#extends Node2D
#
#@export var target_object: Node2D  # The object to measure proximity to
#@export var very_small_proximity = 50  # Distance for very small proximity
#@export var small_proximity = 100  # Distance for small proximity
#@export var medium_proximity = 200  # Distance for medium proximity
#
#@onready var proximity_sprite = $ProximitySprite  # Reference to the Sprite2D node
#@onready var animation_player = $AnimationPlayer  # Reference to the AnimationPlayer node
#
#var score = 0  # Current score
#
## Connect this function to the tram's "stopped" signal
#func _on_tram_stopped(tram_position: Vector2) -> void:
	#var distance = tram_position.distance_to(target_object.global_position)
	#
	#if distance <= very_small_proximity:
		#score += 100
		#print("Very small proximity! +100 points")
		#show_proximity_feedback("very_small")
	#elif distance <= small_proximity:
		#score += 70
		#print("Small proximity! +70 points")
		#show_proximity_feedback("small")
	#elif distance <= medium_proximity:
		#score += 50
		#print("Medium proximity! +50 points")
		#show_proximity_feedback("medium")
	#else:
		#score += 0
		#print("Not even close! +0 points")
		#show_proximity_feedback("not_close")
#
	#print("Current score:", score)
#
## Function to show proximity feedback
#func show_proximity_feedback(proximity_type: String) -> void:
	#match proximity_type:
		#"very_small":
			#proximity_sprite.texture = preload("res://sprites/very_small_proximity.png")
		#"small":
			#proximity_sprite.texture = preload("res://sprites/small_proximity.png")
		#"medium":
			#proximity_sprite.texture = preload("res://sprites/medium_proximity.png")
		#"not_close":
			#proximity_sprite.texture = preload("res://sprites/not_close_proximity.png")
	#
	## Position the sprite at the top center of the camera's view
	#var camera = get_viewport().get_camera_2d()
	#if camera:
		#proximity_sprite.global_position = camera.global_position + Vector2(0, -100)  # Adjust Y offset as needed
#
	## Play the animation to show and fade out the sprite
	#animation_player.play("fade_out")
#
#func show_gratulations() -> void:
	## Show a message or animation for the player
	#print("Congratulations! You've scored points!")
	## You can add more visual feedback here, like playing a sound or showing a UI element
