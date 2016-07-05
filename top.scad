include <constants.scad>;

$fn = 90;

module top() {    
    difference() {
        
        union() {
            cylinder(r = top_outer_diameter/2,
                h = top_height);
            
            for(angle = [0, 90, 180, 270]) {
                rotate([0, 0, angle])
                    translate([arm_radius / 2, 
                                0,
                                top_height - arm_dia / 2])
                
                        rotate([0, 90, 0])
                            cylinder(r = arm_dia / 2, 
                                h = arm_radius,
                                center = true); 
            }
            
            translate([0, 0, -insert_length])
                cylinder(r = tube_inner_diameter/2, 
                        h = insert_length);
        }
        
        union()  {
            translate([0, 0, top_height - top_inner_depth])
                cylinder(r = top_inner_diameter/2,
                        h = top_inner_depth);
            
            for(angle = [0, 90, 180, 270]) {
                rotate([0, 0, angle])
                    translate([arm_radius / 2, 
                                0,
                                top_height - arm_dia / 2])
                
                        rotate([0, 90, 0])
                            cylinder(r = arm_hole_dia / 2, 
                                h = arm_radius,
                                center = true); 
            }
            
            translate([0, 0, -insert_length])
                cylinder(r = insert_hole_dia / 2, 
                        h = insert_length + top_height);
        }
    }
    
    
};


top();