include <constants.scad>;
use<utils.scad>
$fn = 90;


difference() {
    union() {
        cylinder(r = bottom_outer_diameter / 2, h = bottom_height);

        translate([0, 0, bottom_height])
                cylinder(r = insert_diameter/2,
                        h = insert_length);

        arms([0, 180], arm_radius, arm_dia/2, arm_dia);
        arms([90,270], arm_radius, bottom_short_loop_arms_height, arm_dia);
    }

    union() {
        cylinder(r = bottom_inner_diameter / 2, h = bottom_inner_depth);

        cylinder(r = insert_hole_dia / 2,
                h = insert_length + bottom_height);

        arms([0, 180], arm_radius, arm_dia / 2, arm_hole_dia);
        arms([90,270], arm_radius, bottom_short_loop_arms_height, arm_hole_dia);
        arms([0,180], bottom_outer_diameter / 2, bottom_short_loop_arms_height, bottom_work_hole_dia);
    }
}
