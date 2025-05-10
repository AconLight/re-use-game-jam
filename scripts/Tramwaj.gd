extends Node2D
signal na_przystanku(tram_position: Vector2)
func zatrzymaj():
	emit_signal("Stoje" , global_position)
