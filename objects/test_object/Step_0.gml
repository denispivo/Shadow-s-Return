/// @description Insert description here
// You can write your code in this editor
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

var _xinput = _right - _left;
var _yinput = _down - _up;

var _x_movement = _xinput * my_speed;
var _y_movement = _yinput * my_speed_jump;

var _any_key_pressed = false;

if(_up or _down){

	_any_key_pressed = true;

}

if (!place_meeting(x, y + 1, obj_test_object_2) and !_any_key_pressed)
{
    _y_movement = my_speed_jump;
}

if (!place_meeting(x, y + 1, obj_test_object_2))
{
    _up = 0;
}

move_and_collide(_x_movement, _y_movement, obj_test_object_2);