// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));

// movement jump
var _jump_pressed = keyboard_check_pressed(ord("W"));
var _jump_hold = keyboard_check(ord("W"));
var _is_on_ground = place_meeting(x, y + 1, obj_test_object_2);

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

	// move the object down, for how strong the gravity is
	_y_movement += grv;

	// if player is on the ground he can jump again, because of the jump_count
	// if player is in not on the ground, he ran of a cliff, he has one less jump left
	if (_is_on_ground){
		jump_count = 0;
	} else if (jump_count == 0){
		jump_count = 1;
	}

	// jump if player is on the ground
	if (_jump_pressed and jump_count < jump_max){
		jump_count++;
		jump_timer = jump_hold_frame;
	}

	// stop the jump to have a shorter jump
	if (!_jump_hold){
		jump_timer = 0;
	}

	// modify the vertical_movement as long as the jump duration is active
	if (jump_timer > 0) {
		_y_movement = jump_heigth;
		jump_timer--;
	}
	
	// collision check, if the object falls on the ground
	if (place_meeting(x, y + _y_movement, obj_test_object_2)){
		// move as close to the ground as possible and then stop the movement
		while (!place_meeting(x, y + sign(_y_movement), obj_test_object_2)){
			y += sign(_y_movement);
		}
		_y_movement = 0;
		// stop jump if you hit ceiling
		// if object hit a ceiling object can´t go up further, if no objects go up further
		if (_is_ceiling()){
			jump_timer = 0;
			_y_movement = 0;
		}
	}

	// final movement/jump in y direction
	y += _y_movement;

#endregion