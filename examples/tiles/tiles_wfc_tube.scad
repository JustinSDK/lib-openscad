use <experimental/tiles_wfc.scad>;

sample = [
    [ 6, 12,  0,  0,  0,  0,  0,  0, 0,   6, 12],
    [ 3, 15, 12,  6, 12,  6, 14, 14, 12,  3, 9],
    [ 0,  3,  9,  3, 13,  7, 15, 15, 15, 12,  0],
    [ 0,  0,  0,  6, 15, 15, 13,  7, 15, 13,  0],
    [ 0,  6, 14, 15, 15, 15, 13,  7, 15, 13,  0],
    [ 0,  7, 15, 11, 11, 15, 13,  3, 15,  9,  0],
    [ 0,  7, 13, 6, 12,   7,  9,  0,  5,  0,  0],
    [ 0,  7, 15, 11, 9,   5,  0,  6, 15, 12,  0],
    [ 0,  3, 15, 14, 14, 13,  0,  7, 15, 13,  0],    
    [ 6, 12,  3, 11, 11,  9,  0,  3, 11, 15, 12], 
    [ 3,  9,  0,  0,  0,  0,  0,  0,  0,  3,  9]
];

tileW = 10;

color("red") 
translate([-len(sample) * tileW, 0]) {
    text("       sample", valign = "center");
    draw_tubes(sample, tileW);
}

width = 20;
height = 20;
draw_tubes(
    tiles_wfc(width, height, sample), 
    tileW
);

module draw_tubes(tiles, tileW) {
	rows = len(tiles);
	columns = len(tiles[0]);
	for(y = [0:rows - 1]) {
		for(x = [0:columns - 1]) {
			translate([x, rows - y - 1] * tileW)
			tube_tile(tiles[y][x], tileW);
		}
	}
}

module tube_tile(n, width) {
    half_w = width / 2;
	quarter_w = width / 4;
	sixteenth_w = width / 16;
	module tile1() {
	    translate([0, half_w])
	    rotate([90, 0, -90]) {
			rotate_extrude(angle = 90)
			translate([half_w, 0])
			circle(quarter_w);
			
			translate([half_w, 0])
			rotate([90, 0, 0])
			linear_extrude(sixteenth_w, center = true)
				circle(quarter_w * 1.2);
				
			translate([0, half_w])
			rotate([0, 90, 0])
			linear_extrude(sixteenth_w, center = true)
				circle(quarter_w * 1.2);
	    }
	}
	
	module tile3() {
	    mirror([1, 0, 0])
	    translate([-half_w, 0, half_w])
        rotate([0, 90, 0])
		    tile1();
	}

	module tile5() {
	    translate([0, 0, half_w])
	    rotate([90, 0, 0]) {
			linear_extrude(width, center = true)
			circle(quarter_w);
			
			translate([0, 0, half_w])
			linear_extrude(sixteenth_w, center = true)
				circle(quarter_w * 1.2);
				
			translate([0, 0, -half_w])
			linear_extrude(sixteenth_w, center = true)
				circle(quarter_w * 1.2);
		}
	}
	
	module tile7() {
        tile5();
		
		translate([0, 0, half_w])
		rotate([0, 90, 0]) {
			linear_extrude(half_w)
			circle(quarter_w);
			
			translate([0, 0, half_w])
			linear_extrude(sixteenth_w, center = true)
				circle(quarter_w * 1.2);
		}
	}
	
	module tile15() {
	    tile5();
		rotate(90)
		tile5();
	}
	
	if(n == 0) {
	    // no tube
	}
	else if(n == 1) {
		tile1();
	}
	else if(n == 2) {
	    rotate(-90) tile1();
	}
	else if(n == 3) {
	    tile3();
	}
	else if(n == 4) {
	    rotate(-180) tile1();
	}
	else if(n == 5) {
	    tile5();
	}
	else if(n == 6) {
	    rotate(-90) tile3();
	}
	else if(n == 7) {
	    tile7();
	}
	else if(n == 8) {
	    rotate(90) tile1();
	}
	else if(n == 9) {
	    rotate(90) tile3();
	}
	else if(n == 10) {
	    rotate(90) tile5();
	}
	else if(n == 11) {
	    rotate(90) tile7();
	}
	else if(n == 12) {
	    rotate(-180) tile3();
	}
	else if(n == 13) {
	    rotate(180) tile7();
	}
	else if(n == 14) {
	    rotate(270) tile7();
	}
	else if(n == 15) {
	    tile15();
	}
}