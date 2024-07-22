// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// ----------- movement -----------
#region

	// calculate the x movement direction
	_x_movement = (_right - _left) * mvsp;
	
	// calculate the y movement direction
	_y_movement = (_down - _up) * mvsp;

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
	
	// collision check, if you run against a wall or an object
	if (place_meeting(x, y, light)){
		_x_movement += (sign(_x_movement) * light_slow) * (-1);
		_y_movement += (sign(_y_movement) * light_slow) * (-1);
	}

#endregion

// final movement in x and y direction
#region

	// final movement in x and y direction
	x += _x_movement;
	y += _y_movement;

#endregion