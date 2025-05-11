extends Node2D

@export var gui:Node2D
@export var popup: Node2D  # Reference to the node with the `poka` function
@export var range_1 = 50  # Very close range
@export var range_2 = 100  # Medium range
@export var range_3 = 200  # Far range
@onready var animation_sprite = $AnimatedSprite2D

#TODO wywalic
func stop_animation():
	animation_sprite.pause()
func start_animation():
	animation_sprite.play()

func _on_kurs_rozpoczety():
	print("Kurs został rozpoczęty!")

#WOJTAS TODO
#wywolac tylko raz dla jednego przystanku i przekazac tu przystanek. 
func measure_distance_and_call(przystanek):
	var slup = przystanek.get_slup()
	# Ensure both popup and przystanek are assigned

	# Measure the distance from the parent node to the target node
	#var distance = animation_sprite.global_position.x - (slup.global_position.x - 626.0)
	var distance = global_position.x - przystanek.global_position.x
	distance = abs(distance)
	
	print("Distance to target:", distance)

	# Determine the proximity range, call the `poka` function, and update the score
	if distance <= range_1:
		popup.poka(1)  # Variant 1 for very close range 
		gui.update_score(100)
		print("Calling poka with variant 1, +100 points")
		
		przystanek.hasCalculated = true
	elif distance <= range_2:
		popup.poka(2)  # Variant 2 for medium range
		gui.update_score(70)
		print("Calling poka with variant 2, +70 points")
		przystanek.hasCalculated = true
	elif distance <= range_3:
		popup.poka(3)  # Variant 3 for far range
		gui.update_score(30)
		print("Calling poka with variant 3, +30 points")
		przystanek.hasCalculated = true
	else:
		print("Target is out of range, +0 points")
