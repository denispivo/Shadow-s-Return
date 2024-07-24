var pc;
pc = (global.health_points / health_points_max) * 100;

var _show_back = false;

if (global.health_points > 0) {
	_show_back = true;
}

draw_healthbar(test_object_running.x - 20, test_object_running.y - 22, 
				test_object_running.x + 20, test_object_running.y - 25, 
				pc, c_grey, c_yellow, c_yellow, 0, _show_back, false)
