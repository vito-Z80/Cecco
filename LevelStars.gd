extends Node2D

export (PackedScene) var star

func _ready():
	for i in 64:
		var s = star.instance()
		s.modulate = g.get_rnd_color()
		s.position.x = rand_range(0,255)
		s.position.y = rand_range(0,191)
		add_child(s)
	print(get_child_count())
