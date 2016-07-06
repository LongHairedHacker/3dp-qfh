include <constants.scad>;

module arms(angles, radius, height, dia) {
    for(angle = angles) {
    rotate([0, 0, angle])
            translate([radius / 2,
                        0,
                        height])
                rotate([0, 90, 0])
                    cylinder(r = dia / 2,
                        h = radius,
                        center = true);
    }
}
