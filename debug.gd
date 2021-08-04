extends Node


func _process(delta):
	var hero_position = g.hero_position
	hero_position.x = int(int(hero_position.x / 8) * 8)
	hero_position.y = int(int(hero_position.y / 8) * 8)	
	var mouse = g.get_viewport().get_mouse_position()
	mouse.x = int(int(mouse.x / 8) * 8)
	mouse.y = int(int(mouse.y / 8) * 8)
	var dc = Performance.get_monitor(Performance.RENDER_2D_DRAW_CALLS_IN_FRAME)
	OS.set_window_title("fps: " + str(Engine.get_frames_per_second()) + " | draw calls: " + str(dc) +
	 " | mouse: " + str(mouse) + " | hero_position: " + str(hero_position))
