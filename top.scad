include <constants.scad>;
use<utils.scad>;
$fn = 90;

module top() {
    difference() {

        union() {
            cylinder(r = top_outer_diameter / 2,
                h = top_height);

            arms([0, 90, 180, 270], arm_radius, top_height - arm_dia / 2, arm_dia);

            translate([0, 0, -insert_length])
                cylinder(r = insert_diameter / 2,
                        h = insert_length);
        }

        union()  {
            translate([0, 0, top_height - top_inner_depth])
                cylinder(r = top_inner_diameter / 2,
                        h = top_inner_depth);

            arms([0, 90, 180, 270], arm_radius, top_height - arm_dia / 2, arm_hole_dia);

            translate([0, 0, -insert_length])
                cylinder(r = insert_hole_dia / 2,
                        h = insert_length + top_height);
        }
    }


};


top();
