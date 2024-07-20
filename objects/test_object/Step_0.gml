// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));

// movement up and down
var _jump_pressed = keyboard_check_pressed(ord("W"));
var _jump_hold = keyboard_check(ord("W"));
var _is_on_ground = place_meeting(x, y + 1, obj_test_object_2);

// ----------- horizontal movement -----------

// calculate the movement direction
var _x_movement = (_right - _left) * my_speed;

// collision check, if you run against a wall
if (place_meeting(x + _x_movement, y, obj_test_object_2)){
	// move as close to the object as possible
	while (!place_meeting(x + sign(_x_movement), y, obj_test_object_2)){
		x += sign(_x_movement);
	}
	_x_movement = 0;
}

// final movement
x += _x_movement;


// ----------- vertical movement -----------

// calculate the movement direction
vertical_movement += grv;

// collision check, iffall on the ground
if (place_meeting(x, y + vertical_movement, obj_test_object_2)){
	// move as close to the object as possible
	while (!place_meeting(x, y + sign(vertical_movement), obj_test_object_2)){
		y += sign(vertical_movement);
	}
	vertical_movement = 0;
}

// collision check, if you jump to the ceiling
function _is_ceiling () {
	if (place_meeting(x, y - 1, obj_test_object_2)){
		return true;
	}
	return false;
}

// if player is on the ground he can jump again, because of the jump_count
if (_is_on_ground){
	jump_count = 0;
} else if (jump_count == 0){
	jump_count = 1;
}

// jump if player is on the ground
if (_jump_hold and jump_count < jump_max){
	jump_count++;
	jump_timer = jump_hold_frame;
}

// stop the jump to have a shorter jump
if (!_jump_hold){
	jump_timer = 0;
}

// modify the vertical_movement as long as the jump duration is active
if (jump_timer > 0) {
	// if you hit a ceiling you cant jump further, if not you jump further
	if (_is_ceiling()) {
		vertical_movement = 0;
		jump_timer = 0;
	} else {
		vertical_movement = jump_heigth;
		jump_timer--;
	}
}

// final movement
y += vertical_movement;