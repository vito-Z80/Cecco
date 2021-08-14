extends Control

export var text:String
export var text_color:Color = Color.white
export var atlas:AtlasTexture
export var letter_size:int = 8			# fixed letter size = 8x8
export var ascii_start_id:int = 32 		# start ascii id
var text_x = 0
var text_y = 0

func _ready():
	var x = text_x
	for l in text:
		var region_id = l.to_upper().to_ascii()[0] - ascii_start_id 
		add_sprite(region_id,x)
		x += letter_size

#func set_(message:String,x:int,y:int,color:Color = Color.white):
#	var t_x = x
#	for l in text:
#		var region_id = l.to_upper().to_ascii()[0] - ascii_start_id 
#		add_sprite(region_id,x)
#		x += letter_size


func add_sprite(letter_id:int,x:int):
	var s = Sprite.new()
	s.texture = atlas
	s.region_enabled = true
	s.centered = false
	s.region_rect = get_region_by_id(letter_id)
	s.position.x = x
	s.modulate = text_color
	add_child(s)
	
func get_region_by_id(id:int):
	var width = int(atlas.region.size.x / letter_size)
#	var height = int(atlas.region.size.y / letter_size)
	var y = id / width * letter_size
	var x = id % width * letter_size
	return Rect2(x,y,8,8)
