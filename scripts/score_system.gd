extends Node2D

@export var target_object: Node2D  # The object to measure proximity to
@export var very_small_proximity = 50  # Distance for very small proximity
@export var small_proximity = 100  # Distance for small proximity
@export var medium_proximity = 200  # Distance for medium proximity

@onready var proximity_sprite = $ProximitySprite  # Reference to the Sprite2D node
@onready var animation_player = $AnimationPlayer  # Reference to the AnimationPlayer node

@onready var score = 0  # Current score

# Connect this function to the tram's "stopped" signal
func _on_tram_stopped(tram_position: Vector2) -> void:
	var distance = tram_position.distance_to(target_object.global_position)
	
	if distance <= very_small_proximity:
		score += 100
		print("popup1")
		
	elif distance <= small_proximity:
		score += 70
		print("Small proximity! +70 points")
		
	elif distance <= medium_proximity:
		score += 50
		print("Medium proximity! +50 points")
		
	else:
		score += 0
		print("Not even close! +0 points")
		

	print("Current score:", score)

# Function to show proximity feedback
	
	# Position the sprite at the top center of the camera's view
	var camera = get_viewport().get_camera_2d()
	if camera:
		proximity_sprite.global_position = camera.global_position + Vector2(0, -100)  # Adjust Y offset as needed

	# Play the animation to show and fade out the sprite
	animation_player.play("fade_out")

func show_gratulations() -> void:
	# Show a message or animation for the player
	print("Congratulations! You've scored points!")
	# You can add more visual feedback here, like playing a sound or showing a UI element
