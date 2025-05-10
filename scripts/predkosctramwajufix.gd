extends Node

@export var melin:Node2D

@onready var predkosc_tramwaju = 0
@onready var wynik = 0
@onready var naklejka_predkosci = $SpeedLabel  # Reference to the Label node
@onready var naklejka_wyniku = $ScoreLabel

var gaz_wcisniety = false  # Tracks whether the "gaz" button is pressed
var hamulec_wcisniety = false  # Tracks whether the "hamulec" button is pressed
var drag = 2  # Drag value to reduce speed when no button is pressed
var max_speed = 40  # Maximum speed limit

	
func _process(delta: float) -> void:
	if gaz_wcisniety:
		predkosc_tramwaju += delta * 10  # Adjust the multiplier (10) to control the speed increase rate
	if hamulec_wcisniety:
		predkosc_tramwaju -= delta * 15  # Adjust the multiplier (15) to control the braking rate
	if predkosc_tramwaju > 0:  # Apply drag unconditionally when speed is greater than 0
		predkosc_tramwaju -= delta * drag

	# Ensure speed doesn't go below 0
	if predkosc_tramwaju < 0:
		predkosc_tramwaju = 0

	# Cap the speed at max_speed
	if predkosc_tramwaju > max_speed:
		predkosc_tramwaju = max_speed

	naklejka_predkosci.text = str(int(predkosc_tramwaju))  # Update the Label with the integer value
	melin.get_children()[0].velocity = predkosc_tramwaju
	
func update_score(score) -> void:
	wynik += score
	naklejka_wyniku.text = wynik
	
func _input(event: InputEvent) -> void:
	# Check if the up-arrow key is pressed or released
	if event.is_action_pressed("ui_up"):
		gaz_wcisniety = true
		print("ui_up pressed")
	elif event.is_action_released("ui_up"):
		gaz_wcisniety = false
		print("ui_up released")

	# Check if the down-arrow key is pressed or released
	if event.is_action_pressed("ui_down"):
		hamulec_wcisniety = true
		print("ui_down pressed")
	elif event.is_action_released("ui_down"):
		hamulec_wcisniety = false
		print("ui_down released")

func _on_button_pressed() -> void:
	gaz_wcisniety = true  # Start increasing speed

func _on_button_released() -> void:
	gaz_wcisniety = false  # Stop increasing speed

func _hamulec() -> void:
	hamulec_wcisniety = true  # Start decreasing speed

func _gaz() -> void:
	gaz_wcisniety = true  # Start increasing speed
