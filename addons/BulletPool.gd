extends Node2D
class_name BulletPool

var pool = Array()

func get_bullet(parent,bullet_node):
	print(pool.size())
	if pool.empty():
		return create_new_bullet(parent,bullet_node)
	else:
		return find_free(parent,bullet_node)

func find_free(parent,bullet_node):
	for b in pool:
		if not b.visible:
			b.visible = true
			b.position.x = 0
			b.position.y = 0
			return b
	return create_new_bullet(parent,bullet_node)

func create_new_bullet(parent,bullet_node):
	var b = bullet_node.instance()
	pool.append(b)
	parent.add_child(b)
	return b
