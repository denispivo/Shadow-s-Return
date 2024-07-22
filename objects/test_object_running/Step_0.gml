// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

// ----------- horizontal movement -----------
#region

	// calculate the movement direction
	_x_movement = (_right - _left) * mvsp;

	// collision check, if you run against a wall
	if (place_meeting(x + _x_movement, y, obj_test_object_2)){
		// move as close to the wall as possible
		while (!place_meeting(x + sign(_x_movement), y, obj_test_object_2)){
			x += sign(_x_movement);
		}
		_x_movement = 0;
	}

	// final movement in x direction
	x += _x_movement;

#endregion

// ----------- vertical movement -----------
#region

	// calculate the movement direction
	_y_movement = (_down - _up) * mvsp;

	// collision check, if you run against a wall
	if (place_meeting(x, y + _y_movement, obj_test_object_2)){
		// move as close to the wall as possible
		while (!place_meeting(x, y + sign(_y_movement), obj_test_object_2)){
			y += sign(_y_movement);
		}
		_y_movement = 0;
	}

	// final movement in x direction
	y += _y_movement;

#endregion