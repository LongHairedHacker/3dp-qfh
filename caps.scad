include <constants.scad>;

$fn = 90;

module cap(height) {
    difference() {
        union() {
            cylinder(d = support_cap_outer_dia,
                h = height);
            
            translate([0, 0, height])
                cylinder(d = insert_diameter,
                    h = insert_length);
        }
        union()  {
            cylinder(d = support_cap_inner_dia,
                h = height * 0.75);
            
            cylinder(d = insert_hole_dia,
                    h = height + insert_length);
            
            translate([0, 0, support_cap_hole_height])
            rotate([0, 90, 0])
            cylinder(d = support_cap_hole_dia,
                h = support_cap_outer_dia,
                center = true);
       }
    }
}

translate([20, 0, 0])
    cap(short_support_cap_height);

translate([-20, 0, 0])
    cap(long_support_cap_height);