extends Node2D
var path = "res://assets/graphics/scroller_tiles/"
var path_background = "res://assets/graphics/scroller_background/"
var path_buildings = "res://assets/graphics/scroller_buildings/"
var path_cars = "res://assets/graphics/scroller_cars/"
var path_latarnia = "res://assets/graphics/scroller_latarnia/"
var path_cars_cars = "res://assets/graphics/scroller_carscars/"
var path_pavement = "res://assets/graphics/scroller_pavement/"
var path_front_pavement = "res://assets/graphics/scroller_front_pavement/"
@onready var scroller = $Scroller

@export var drzwi:Node2D

var velocity = 100
var velocity_factor = 10

var background_scroller
var building_scroller
var back_pavement_scroller
var cars_scroller
var latarnia_scroller
var front_pavement_scroller
var cars_cars_scroller

var stop_prefab

var pociong
var stop_scroller

var scrollers = []

func _init():
	pass


func _ready() -> void:
	background_scroller = $Scroller.duplicate()
	building_scroller = $Scroller.duplicate()
	back_pavement_scroller = $Scroller.duplicate()
	cars_scroller = $Scroller.duplicate()
	latarnia_scroller = $Scroller.duplicate()
	cars_cars_scroller = $Scroller.duplicate()
	front_pavement_scroller = $Scroller.duplicate()
	stop_scroller = $Scroller.duplicate()
	
	scrollers = [
		background_scroller, 
		
		back_pavement_scroller, 
		building_scroller, 
		cars_scroller,
		latarnia_scroller,
		cars_cars_scroller,
		front_pavement_scroller,
		stop_scroller]
		
	background_scroller.load_scroller(path_background, 200, 0.2)
	background_scroller.width_factor = 0.95
	back_pavement_scroller.load_scroller(path_pavement, 390, 1)
	back_pavement_scroller.width_factor = 0.85
	back_pavement_scroller.scl_factor = 1.85
	building_scroller.load_scroller(path_buildings, 58, 1)
	building_scroller.rnd_factor = 300
	building_scroller.width_factor = 1.2
	cars_scroller.load_scroller(path_cars, 95, 1)
	cars_scroller.width_factor = 4
	cars_scroller.scl_factor = 0.6
	cars_scroller.rnd_factor = 200
	
	latarnia_scroller.load_scroller(path_latarnia, 20, 1)
	latarnia_scroller.width_factor = 0.8
	latarnia_scroller.scl_factor = 0.6
	latarnia_scroller.rnd_factor = 0
	
	cars_cars_scroller.load_scroller(path_cars_cars, 230, 1.4)
	cars_cars_scroller.scl_factor = 6
	cars_cars_scroller.width_factor = 3
	cars_cars_scroller.rnd_factor = 300
	
	front_pavement_scroller.load_scroller(path_front_pavement, 390, 0.4)
	front_pavement_scroller.width_factor = 0.85
	front_pavement_scroller.scl_factor = 1.85
	
	#stop_prefab = get_parent().przystanek
	var stop_prefab = preload("res://scenes/przystanek.tscn")

	#stop_prefab.visible = true
	var stop_width = 2000
	stop_scroller.load_scroller_prefab(stop_prefab, 2000, 0, 0.4, drzwi)
	stop_scroller.max_tiles_width = stop_width * 5
	
	pociong = get_parent().pociong
	
	for scroller in scrollers:
		add_child(scroller)
	

func _process(delta):
	for scroller in scrollers:
		scroller.velocity = velocity*velocity_factor
		
		
	var offset = 0
	#print("stop_scroller.tiles.size() > 0" + stop_scroller.tiles.size() > 0)
	#if stop_scroller.tiles.size() > 1 and velocity <= 0.00001: 
		#for i in range(stop_scroller.tiles.size()):
			#
			#offset = 2
			#print(stop_scroller.tiles.size())
			#if stop_scroller.tiles[i].hasCalculated == false:
				#print("prces scrall manager")
				#print(stop_scroller.tiles.size())
				#print("not stop_scroller.tiles[0].hasCalculated" )
				#print(not stop_scroller.tiles[i].hasCalculated)
			#
				#pociong.measure_distance_and_call(stop_scroller.tiles[i])
		#print("stop_scroller.tiles.size() > 0" + stop_scroller.tiles.size() > 0)
	for tile in stop_scroller.tiles:
		if stop_scroller.tiles.size() > 1 and velocity <= 0.00001:
			print("prces scrall manager")
			print(stop_scroller.tiles.size())
			print("not stop_scroller.tiles[0].hasCalculated" )
			print(not stop_scroller.tiles[0].hasCalculated)

			pociong.measure_distance_and_call(tile)
			tile.hasCalculated = true
			

			
			
		
	
