module case () {
  scale([1.01,1.01,1.01])
  import("case.stl");
}

module cup(z) {
  scale([1,1,z]) translate([-13,68,0]) 
  difference() {
    hull() {
      difference() {
        scale([1.05,1.05,1])
          translate([10,-70,0])
  	  case();

        translate([13,-68,1]) case();
        translate([10,-30,-5]) cube([100,100,20]);
      }
    }

  translate([13,-68,2]) case();
  translate([10,-30,-5]) cube([100,100,20]);
  translate([-10,60,-5]) cube([100,100,20]);
  }
}

x=-100;
y=70;
angle=37;

intersection() {
  union() {
    rotate([0,-angle,0]) translate([-x,-y,0]) cup(0.4);
    
    difference() {
      linear_extrude(height=100)
        rotate([0,-angle,0])
	translate([-x,-y,0])
	projection()
	cup(0.4);
	
    rotate([0,-angle,0])
      translate([0,-200,0])
      cube([300,300,300]);
    }
  }

  translate([0,-200,0]) cube([300,300,300]);
}
