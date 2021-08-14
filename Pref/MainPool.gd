tool
extends Node2D
class_name MainPool
export (PackedScene) var visual_node
export var pool_name:String
onready var pool = g.pools.get(pool_name) as Array
signal launch(world_position,speed,flip_offset)

func create_new_enemy(world_position,speed,flip_offset):
	var e = visual_node.instance()
	e.emit_signal("launch", world_position, speed, flip_offset)
	pool.append(e)
	get_tree().current_scene.add_child(e)

func init_enemy(world_position,speed,flip_offset):
	for e in pool:
		if not e.visible:
			e.emit_signal("launch", world_position, speed, flip_offset)
			return
	create_new_enemy(world_position,speed,flip_offset)

func launch(world_position,speed,flip_offset):
	if pool.empty():
		create_new_enemy(world_position,speed,flip_offset)
	else:
		init_enemy(world_position,speed,flip_offset)


func _on_MainPool_launch(world_position, speed, flip_offset):
	if pool.empty():
		create_new_enemy(world_position,speed,flip_offset)
	else:
		init_enemy(world_position,speed,flip_offset)
