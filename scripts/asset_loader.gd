extends Node2D

@onready var animation = $AnimatedSprite2D

var tiles_dict = {}


func _init():
	pass


func _ready() -> void:
	pass
	
	
func _process(delta):
	pass

func get_asset_props(name):
	return tiles_dict[name]

func load_asset(name) -> AnimatedSprite2D:
	var new_asset = AnimatedSprite2D.new()
	print(new_asset.get_name())
	var sprite_frames = SpriteFrames.new()
	sprite_frames.add_animation("default")
	var idx = 0
	for frame in tiles_dict[name]["textures"]:
		sprite_frames.add_frame("default", frame, 0.4)
		idx += 1
	new_asset.frames = sprite_frames
	return new_asset
	
func load_all(path):
	var dir = DirAccess.open(path)
	var files = dir.get_files()
	for file: String in files:
		if file.contains(".import"):
			continue
		var name = file.get_basename()
		var regex = RegEx.new()
		regex.compile("^(.*?)(\\d+)$")  # Group 1: text, Group 2: number
		var result = regex.search(name)
		if result:
			var text_part = result.get_string(1)  # "asd_asd"
			var number_part = int(result.get_string(2))  # 12
			#print("Text:", text_part)
			#print("Number:", number_part)
			var tex = load(path + file)
			if text_part not in tiles_dict.keys():
				tiles_dict[text_part] = {
						"textures": [tex],
						"width": tex.get_width()
					}
			else:
				tiles_dict.get(text_part).get("textures").append(tex)
	
	print(tiles_dict)
			
