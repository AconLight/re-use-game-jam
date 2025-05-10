extends Node2D

@export var gui:Node2D
@export var popup: Node2D  # Reference to the node with the `poka` function
@export var range_1 = 50  # Very close range
@export var range_2 = 100  # Medium range
@export var range_3 = 200  # Far range

#TODO wywalic
var score = 0  # Variable to track the score

func _on_kurs_rozpoczety():
	print("Kurs został rozpoczęty!")

#WOJTAS TODO
#wywolac tylko raz dla jednego przystanku i przekazac tu przystanek. 
func measure_distance_and_call(przystanek):
	var slup = przystanek.get_slup()
	# Ensure both popup and przystanek are assigned

	# Measure the distance from the parent node to the target node
	var distance = global_position.distance_to(slup.global_position)
	print("Distance to target:", distance)

	# Determine the proximity range, call the `poka` function, and update the score
	if distance <= range_1:
		popup.poka(1)  # Variant 1 for very close range
		score += 100  # Add 100 points for range 1
		gui.update_score(100) #TODO
		print("Calling poka with variant 1, +100 points")
	elif distance <= range_2:
		popup.poka(2)  # Variant 2 for medium range
		score += 70  # Add 70 points for range 2
		print("Calling poka with variant 2, +70 points")
	elif distance <= range_3:
		popup.poka(3)  # Variant 3 for far range
		score += 30  # Add 30 points for range 3
		print("Calling poka with variant 3, +30 points")
	else:
		print("Target is out of range, +0 points")

	# Print the updated score
	print("Current score:", score)
