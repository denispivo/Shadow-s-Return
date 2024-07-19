// ----------- inputs -----------

// movement left and right
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));

// movement up and down
var _jump_pressed = keyboard_check(ord("W"));
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
vertival_movement += grv;

// collision check, if you jump to the ceiling or fall on the ground
if (place_meeting(x, y + vertival_movement, obj_test_object_2)){
	// move as close to the object as possible
	while (!place_meeting(x, y + sign(vertival_movement), obj_test_object_2)){
		y += sign(vertival_movement);
	}
	vertival_movement = 0;
}

// jump if player is on the ground
if (_is_on_ground and _jump_pressed){
	vertival_movement -= jump_heigth;
}

if (jump_timer > 0) {
	vertival_movement = jump_heigth;
	
	jump_timer--;
}

// final movement
y += vertival_movement;