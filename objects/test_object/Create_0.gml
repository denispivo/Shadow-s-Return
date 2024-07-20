// variables
grv = 0.3;
mvsp = 4;

// horizontal movement
_x_movement = 0;

// vertical movement/jump
_y_movement = 0;
jump_heigth = -6;

jump_max = 2;
jump_count = 0;

jump_hold_frame = 15;
jump_timer = 0;

// ----------- functions -----------

// collision check, if you jump to the ceiling
function _is_ceiling () {
	if (place_meeting(x, y - 1, obj_test_object_2)){
		return true;
	}
	return false;
}
