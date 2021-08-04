extends Node2D
class_name BulletPool, "res://Pref/BulletPool.gd"


var pool = Array()
func add_bullet(bullet_node, bullet_position):
	if pool.empty():
		create_new_bullet(bullet_node, bullet_position)
	else:
		find_free(bullet_node, bullet_position)

func find_free(bullet_node, bullet_position):
	var count = pool.size()
	for b in pool:
		if !b.visible:
			b.visible = true
			b.position = bullet_position
		else:
			count -= 1
	if count == 0:
		create_new_bullet(bullet_node, bullet_position)

func create_new_bullet(bullet_node, bullet_position):
	var b = bullet_node.instance()
	b.visible = false
	b.position = bullet_position
	add_child(b)
	pool.append(b)
