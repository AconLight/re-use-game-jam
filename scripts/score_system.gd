extends Node2D

@export var popup: Node2D  # Reference to the node with the `poka` function
@export var target_node: Node2D  # Reference to the node to measure distance to
@export var range_1 = 50  # Very close range
@export var range_2 = 100  # Medium range
@export var range_3 = 200  # Far range

var score = 0  # Variable to track the score

func measure_distance_and_call():
	# Ensure both popup and target_node are assigned
	if not popup or not target_node:
		print("Error: popup or target_node is not assigned!")
		return

	# Measure the distance from the parent node to the target node
	var distance = global_position.distance_to(target_node.global_position)
	print("Distance to target:", distance)

	# Determine the proximity range, call the `poka` function, and update the score
	if distance <= range_1:
		popup.poka(1)  # Variant 1 for very close range
		score += 100  # Add 100 points for range 1
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
