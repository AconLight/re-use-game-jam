extends Node2D
var path = "res://assets/graphics/scroller_tiles/"
@onready var scroller = $Scroller

var velocity = 100
var velocity_factor = 10

var background_scroller
var building_scroller
var back_pavement_scroller

var scrollers = []

func _init():
	pass


func _ready() -> void:
	background_scroller = $Scroller.duplicate()
	building_scroller = $Scroller.duplicate()
	back_pavement_scroller = $Scroller.duplicate()
	scrollers = [background_scroller, building_scroller, back_pavement_scroller]
	background_scroller.load_scroller(path, 0, 0.2)
	building_scroller.load_scroller(path, 100, 0.5)
	back_pavement_scroller.load_scroller(path, 200, 1)
	for scroller in scrollers:
		add_child(scroller)
	

func _process(delta):
	for scroller in scrollers:
		scroller.velocity = velocity*velocity_factor
		
	
