extends Node

@export var melin:Node2D
@export var pociag:Node2D
@export var camera:Camera2D
@onready var predkosc_tramwaju = 0
@onready var wynik = 0
@onready var naklejka_predkosci = $SpeedLabel
@onready var intro = $Intro  # Reference to the Label node
@onready var naklejka_wyniku = $ScoreLabel
@onready var outro = $Outro # Reference to the Label node



var gaz_wcisniety = false  # Tracks whether the "gaz" button is pressed
var hamulec_wcisniety = false  # Tracks whether the "hamulec" button is pressed
var drag = 2  # Drag value to reduce speed when no button is pressed
var max_speed = 60 # Maximum speed limit

	
func _process(delta: float) -> void:
	if gaz_wcisniety:
		predkosc_tramwaju += delta * 10  # Adjust the multiplier (10) to control the speed increase rate
	if hamulec_wcisniety:
		predkosc_tramwaju -= delta * 25  # Adjust the multiplier (15) to control the braking rate
	if predkosc_tramwaju > 0:  # Apply drag unconditionally when speed is greater than 0
		predkosc_tramwaju -= delta * drag

	# Ensure speed doesn't go below 0
	if predkosc_tramwaju <= 0:
		predkosc_tramwaju = 0
		pociag.stop_animation()
	if predkosc_tramwaju >= 5:
		pociag.start_animation()
		

	# Cap the speed at max_speed
	if predkosc_tramwaju > max_speed:
		predkosc_tramwaju = max_speed

	naklejka_predkosci.text = str(int(predkosc_tramwaju))  # Update the Label with the integer value
	melin.get_children()[0].velocity = predkosc_tramwaju
	var x = 5
	var zoom = 1.4 - (predkosc_tramwaju+x)/(60+x)
	zoom = zoom**0.3
	camera.zoom = Vector2(zoom, zoom)
	
func update_score(score) -> void:
	wynik += score
	naklejka_wyniku.text = str(wynik)
	
func _input(event: InputEvent) -> void:
	# Check if the up-arrow key is pressed or released
	if event.is_action_pressed("ui_up"):
		intro.schowaj()
		gaz_wcisniety = true
		#print("ui_up pressed")
	elif event.is_action_released("ui_up"):
		gaz_wcisniety = false
		#print("ui_up released")

	# Check if the down-arrow key is pressed or released
	if event.is_action_pressed("ui_down"):
		hamulec_wcisniety = true
		#print("ui_down pressed")
	elif event.is_action_released("ui_down"):
		hamulec_wcisniety = false
		#print("ui_down released")
	if Input.is_key_pressed(KEY_I):
		if wynik > 100:
			outro.prosze_pokazac_artykul(1)
		elif wynik > 70:
			outro.prosze_pokazac_artykul(2)
		else:
			outro.prosze_pokazac_artykul(3)
	if Input.is_key_pressed(KEY_P):
		outro.visible = false
		intro.poka()
		wynik = 0
		

func _on_button_pressed() -> void:
	gaz_wcisniety = true  # Start increasing speed

func _on_button_released() -> void:
	gaz_wcisniety = false  # Stop increasing speed

func _hamulec() -> void:
	hamulec_wcisniety = true  # Start decreasing speed

func _gaz() -> void:
	gaz_wcisniety = true  # Start increasing speed
