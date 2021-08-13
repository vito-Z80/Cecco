extends Node2D

#onready var viewport = get_viewport()
#onready var viewport_rect = get_viewport_rect()
#onready var viewport_transform = get_viewport_transform()
#onready var canvas_rid = get_canvas()
#onready var canvas_item = get_canvas_item()

var hero_position:Vector2
#------------------Enemy pools--------------------------------
var e_balls = Array()
var e_missile_01 = Array()

var pools = {
	"enemy_balls": Array(),
	"enemy_missiles_01": Array(),
	"enemy_aliens": Array(),
	"enemy_explosions": Array(),
}


#-----------------------------------------------------------
var item_ammo = 99
var item_grenades = 10
var item_points = 0
var item_lives = 9
var item_zones = 0
#-----------------------------------------------------------
var jump:bool = false
var is_dead:bool = false
#-----------------------------------------------------------

func new_game_init():
	clear_items()
#	jump = false

func clear_items():
	item_ammo = 99
	item_grenades = 10
	item_points = 0
	item_lives = 9
	item_zones = 0

func get_rnd_color():
	return zx_flash[rand_range(0,zx_flash.size() - 1)]
	
func get_rnd_color_6():
	return zx_flash[rand_range(2,zx_flash.size())]

var zx_flash = [
	zx_color.BLACK,
	zx_color.BLUE,
	zx_color.RED,
	zx_color.PURPLE,
	zx_color.GREEN,
	zx_color.CYAN,
	zx_color.YELLOW,
	zx_color.WHITE,
]
enum zx_color{
	BLACK = 0x000000FF,
	BLUE = 0x0000FFFF,
	BLUE_DARK = 0x0000CCFF,
	RED = 0xFF0000FF,
	RED_DARK = 0xCC0000FF,
	YELLOW = 0xFFFF00FF,
	YELLOW_DARK = 0xCCCC00FF,
	GREEN = 0x00FF00FF,
	GREEN_DARK = 0x00CC00FF,
	PURPLE = 0xFF00FFFF,
	PURPLE_DARK = 0xCC00CCFF,
	CYAN = 0x00FFFFFF,
	CYAN_DARK = 0x00CCCCFF,
	WHITE = 0xFFFFFFFF,
	WHITE_DARK = 0xCCCCCCFF,
}
