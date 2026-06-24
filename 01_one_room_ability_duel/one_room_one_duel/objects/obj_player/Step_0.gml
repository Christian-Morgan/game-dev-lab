// Holding right click updates the target while dragging
if (mouse_check_button(mb_right)) {
    target_x = mouse_x;
    target_y = mouse_y;
    is_moving = true;
}

var desired_x = 0;
var desired_y = 0;

if (is_moving) {
    var dist = point_distance(x, y, target_x, target_y);

    if (dist > stop_distance) {
        var dir = point_direction(x, y, target_x, target_y);

        desired_x = lengthdir_x(move_speed, dir);
        desired_y = lengthdir_y(move_speed, dir);
    } else {
        is_moving = false;
    }
}

// Smoothly turn current movement toward desired movement
vel_x = lerp(vel_x, desired_x, turn_response);
vel_y = lerp(vel_y, desired_y, turn_response);

// Stop tiny drifting
if (!is_moving && point_distance(0, 0, vel_x, vel_y) < 0.05) {
    vel_x = 0;
    vel_y = 0;
}

x += vel_x;
y += vel_y;