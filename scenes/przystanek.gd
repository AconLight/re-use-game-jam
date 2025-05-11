extends Node2D

@export var drzwi_przystanek:Node2D
@export var slup:Node2D

var hasCalculated = false

signal wsiadac  # Define the signal
func emit():
	emit_signal("wsiadac") 
func get_drzwi():
	return drzwi_przystanek

func get_slup():
	return slup
