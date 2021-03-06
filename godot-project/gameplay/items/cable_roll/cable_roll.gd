extends KinematicBody2D


var origin = null
var throwing_cable = false
signal connection_started
signal connection_ended


func _start():
	set_process(throwing_cable)


func start_throwing(new_origin):
	origin = new_origin
	throwing_cable = true
	set_process(true)
	emit_signal('connection_started', origin)
	

func stop_throwing():
	throwing_cable = false
	origin = null
	set_process(false)
	update()


func _process(_delta):
	if throwing_cable and origin:
		update()


func _draw():
	if origin:
		draw_line(to_local(origin.global_position), Vector2(0, 0), Color.aliceblue, 3.0)


func connect_to(target, connections):
	connections.add_connection(origin, target)
	emit_signal('connection_ended', target)
	stop_throwing()
