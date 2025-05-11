extends Node2D

@export var tekst: RichTextLabel
@export var noded: Node2D
@export var dzwonek: AudioStreamPlayer2D

#func _ready() -> void:
	#poka(1)
	
func poka(popapik: int):
	
	match popapik:
		1: tram_perfect()
		2: tram_spoko()
		3: tram_ok()
	
	tekst.visible = true
	tekst.modulate.a = 0.0

	var tween := create_tween()
	#tween.tween_interval(0.3)
	dzwonek.play(0.1)
	tween.tween_property(tekst, "modulate:a", 1.0, 0.1) # Fade in

	tween.tween_interval(0.5) # Czekaj, aż tekst będzie widoczny

	tween.tween_property(tekst, "modulate:a", 0.0, 2) # Fade out

	tween.tween_callback(Callable(self, "_on_feedback_hidden"))


func _on_feedback_hidden():
	tekst.visible = false

			
func tram_perfect() -> void:
	tekst.text = "[shake rate=30.0 level=50 connected=1][rainbow freq=0.2 sat=1 val=1 speed=1.0]Perfekcyjnie!"
	
func tram_spoko() -> void:
	tekst.text = "[wave amp=50.0 freq=10 connected=1][rainbow freq=0.2 sat=0.2 val=1 speed=1.0]Solidnie!"
	
func tram_ok() -> void:
	tekst.text = "[fade start=3 length=9]Fuszerkaaaaa"
	
