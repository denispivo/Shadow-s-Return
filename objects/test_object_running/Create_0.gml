// time you can stay in the light, calles health
	// bar increases and resets game if the bar is full
global.health_points = 0;
health_points_max = 100;
health_dmg = 1;
health_regen = 0.5;

// variables for movement
mvsp = 4;
light_slow = 1.5;
dash = 50;

// horizontal movement
_x_movement = 0;

// vertical movement
_y_movement = 0;

objects = [obj_test_object_2, test_light_source];
light = [test_light_1, test_light_2];