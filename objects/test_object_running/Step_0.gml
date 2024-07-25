// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));
var _dash = keyboard_check_pressed(vk_space);

// ----------- movement -----------
#region

	// calculate the x movement direction
	_x_movement = (_right - _left) * mvsp;
	
	// calculate the y movement direction
	_y_movement = (_down - _up) * mvsp;

#endregion

// ----------- dash -----------
#region

	if (_dash) {
		// calculate the x movement direction for the dash
		_x_movement += (_right - _left) * dash;
	
		// calculate the y movement direction for the dash
		_y_movement += (_down - _up) * dash;
	}

#endregion

// ----------- collision check -----------
#region

	// collision check, if you run against a wall or an object
	if (place_meeting(x + _x_movement, y, objects)){
		// move as close to the wall as possible
		while (!place_meeting(x + sign(_x_movement), y, objects)){
			x += sign(_x_movement);
		}
		_x_movement = 0;
	}

	// collision check, if you run against a wall or an object
	if (place_meeting(x, y + _y_movement, objects)){
		// move as close to the wall as possible
		while (!place_meeting(x, y + sign(_y_movement), objects)){
			y += sign(_y_movement);
		}
		_y_movement = 0;
	}
	
	// collision check, if you run into light
	if (place_meeting(x, y, light)){
		//slow the object
		_x_movement += (sign(_x_movement) * light_slow) * (-1);
		_y_movement += (sign(_y_movement) * light_slow) * (-1);
		// increase the stay in light bar
		global.health_points += health_dmg;
	} else if (global.health_points > 0) {
		global.health_points -= health_regen;
	}
	
	// decrease stay in light bar, if you are not in the light


	show_debug_message(global.health_points);
	
	// restarts the game if stay in light bar is full
	if (global.health_points >= health_points_max) {
		game_restart();
	}

#endregion


// final movement in x and y direction
#region

	// final movement in x and y direction
	x += _x_movement;
	y += _y_movement;

#endregion