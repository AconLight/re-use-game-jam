extends Node2D

var space_between = 0
var margin = 300
var tile_position_x = -margin
var next_position_x = 1500
var tiles = []
var tiles_lengths = []
var max_tiles_width = next_position_x + margin
var velocity = 100
var velocity_factor = 1
var rng = RandomNumberGenerator.new()

var prefab
var prefab_width
var prefabIdx = 0

@onready var asset_loader = $AssetLoader

func _init():
	print("Hello, world!")


func _ready() -> void:
	pass
	
func _process(delta):
	print("scroller _process")
	if $AssetLoader.tiles_dict.keys().size() > 0:
		print("add_prefab pre")
		tile_position_x -= delta*velocity*velocity_factor
		while tile_position_x < next_position_x:
			var tile_names = $AssetLoader.tiles_dict.keys()
			var tile_name = tile_names[rng.randi_range(0, tile_names.size()-1)]
			print("tile_name")
			print(tile_name)
			add_tile(tile_name)
	elif prefab:
		tile_position_x -= delta*velocity*velocity_factor
		while tile_position_x < next_position_x:
			add_prefab(self.prefab, self.prefab_width)

	for tile in tiles:
		tile.position.x -= delta*velocity*velocity_factor
		
func load_scroller(path, y, velocity_factor):
	$AssetLoader.load_all(path)
	position.y = y
	self.velocity_factor = velocity_factor
	
func load_scroller_prefab(prefab, width, y, velocity_factor):
	self.prefab = prefab
	self.prefab_width = width
	position.y = y
	self.velocity_factor = velocity_factor

func add_prefab(prefab, width):
	var tile = prefab
	tiles.append(tile)
	tiles_lengths.append(width)
	add_child(tile)
	tile.position.x = tile_position_x
	tile_position_x += tiles_lengths[-1]
	var tiles_all_width = tiles_lengths.reduce(func(accum, value): return accum + value, 0)
	if tiles_all_width > max_tiles_width:
		remove_child(tiles[0])
		tiles.remove_at(0)
		tiles_lengths.remove_at(0)
		
func add_tile(tile_name):
	var tile = $AssetLoader.load_asset(tile_name)
	tiles.append(tile)
	tiles_lengths.append($AssetLoader.get_asset_props(tile_name).width)
	add_child(tile)
	tile.position.x = tile_position_x
	tile.play("default")
	tile_position_x += tiles_lengths[-1]
	var tiles_all_width = tiles_lengths.reduce(func(accum, value): return accum + value, 0)
	if tiles_all_width > max_tiles_width:
		remove_child(tiles[0])
		tiles.remove_at(0)
		tiles_lengths.remove_at(0)

		
	
	
	
