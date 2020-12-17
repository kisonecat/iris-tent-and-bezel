module hullinvert() {
  difference() {
    hull() children();
    children();
  }
}

module screwholes() {
  hullinvert() resize([153.667,133.907]) 
  import("plate.dxf",center=true);
}
    
module case() {
  translate([0,0,0])
    hullinvert()
    resize([153.667,133.907])
    import("outline.dxf",center=true);
}

module screws(){
  difference() {
    case();
    screwholes();
  }
}

difference() {
  linear_extrude(height=3.4) offset(r=1) case();

  translate([0,0,-1]) linear_extrude(height=2.6) offset(r=1-0.12*4) case();

  translate([0,0,-1]) linear_extrude(height=10) offset(r=-4.3) case();
    
  linear_extrude(height=3.4-0.24)
    offset(r=2)
    screws();
}
