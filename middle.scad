include <constants.scad>;
use<utils.scad>;
$fn = 90;

difference() {
	union() {
		cylinder(r = middle_outer_diameter / 2,
			h = middle_height);

        translate([0, 0, -insert_length])
            cylinder(r = insert_diameter / 2,
                    h = insert_length);

		translate([0, 0, middle_height])
            cylinder(r = insert_diameter / 2,
                    h = insert_length);

		arms([0, 180], insert_arm_radius, middle_long_loop_arms_height, insert_diameter);
        arms([90, 270], insert_arm_radius, middle_short_loop_arms_height, insert_diameter);
	}


	union() {
		cylinder(r = middle_inner_diameter / 2,
			h = middle_height);

		translate([0, 0, -insert_length])
			cylinder(r = insert_hole_dia / 2,
				h = insert_length);

		translate([0, 0, middle_height])
				cylinder(r = insert_hole_dia / 2,
				h = insert_length);
        
        arms([0, 180], insert_arm_radius, middle_long_loop_arms_height, insert_hole_dia);
        arms([90, 270], insert_arm_radius, middle_short_loop_arms_height, insert_hole_dia);
	}
}
