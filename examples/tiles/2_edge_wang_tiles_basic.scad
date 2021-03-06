use <experimental/tiles_wang_2e.scad>;
use <arc.scad>;

rows = 10;
columns = 15;
tile_width = 10;
tile_thickness = 2;
$fn = 24;

tiles_wang_2e(rows, columns, tile_width) {
    sample_tile(0, tile_width, tile_thickness);
	sample_tile(1, tile_width, tile_thickness);
	sample_tile(2, tile_width, tile_thickness);
	sample_tile(3, tile_width, tile_thickness);
	sample_tile(4, tile_width, tile_thickness);
	sample_tile(5, tile_width, tile_thickness);
	sample_tile(6, tile_width, tile_thickness);
	sample_tile(7, tile_width, tile_thickness);
	sample_tile(8, tile_width, tile_thickness);
	sample_tile(9, tile_width, tile_thickness);
	sample_tile(10, tile_width, tile_thickness);
	sample_tile(11, tile_width, tile_thickness);
	sample_tile(12, tile_width, tile_thickness);
	sample_tile(13, tile_width, tile_thickness);
	sample_tile(14, tile_width, tile_thickness);
	sample_tile(15, tile_width, tile_thickness);
}

translate([0, tile_width * (rows + 1)]) {
    color("LightGrey")
    linear_extrude(tile_thickness / 2)
        square([columns * tile_width, rows * tile_width]);
	
	color("green")
	linear_extrude(tile_thickness)
		tiles_wang_2e(rows, columns, tile_width) {
			path_tile(0, tile_width);
			path_tile(1, tile_width);
			path_tile(2, tile_width);
			path_tile(3, tile_width);
			path_tile(4, tile_width);
			path_tile(5, tile_width);
			path_tile(6, tile_width);
			path_tile(7, tile_width);
			path_tile(8, tile_width);
			path_tile(9, tile_width);
			path_tile(10, tile_width);
			path_tile(11, tile_width);
			path_tile(12, tile_width);
			path_tile(13, tile_width);
			path_tile(14, tile_width);
			path_tile(15, tile_width);
		}
}

module sample_tile(n, width, thickness) {
    half_w = width / 2;
	
	diff_polygons = [
	    [[]],
		[[[0, 0], [half_w, half_w], [-half_w, half_w]]],
		[[[0, 0], [half_w, -half_w], [half_w, half_w]]],
		[[[-half_w, half_w], [half_w, -half_w], [half_w, half_w]]],
		[[[0, 0], [-half_w, -half_w], [half_w, -half_w]]],
		[
		    [[0, 0], [half_w, half_w], [-half_w, half_w]],
		    [[0, 0], [-half_w, -half_w], [half_w, -half_w]]
		],
		[[[-half_w, -half_w], [half_w, -half_w], [half_w, half_w]]],
		[[[0, 0], [-half_w, -half_w], [half_w, -half_w], [half_w, half_w], [-half_w, half_w]]],
		[[[0, 0], [-half_w, half_w], [-half_w, -half_w]]],
		[[[-half_w, half_w], [-half_w, -half_w], [half_w, half_w]]],
		[
		    [[0, 0], [-half_w, half_w], [-half_w, -half_w]],
		    [[0, 0], [half_w, -half_w], [half_w, half_w]]
		],
		[[[0, 0], [half_w, -half_w], [half_w, half_w], [-half_w, half_w], [-half_w, -half_w]]],
		[[[-half_w, half_w], [-half_w, -half_w], [half_w, -half_w]]],
		[[[0, 0], [half_w, half_w], [-half_w, half_w], [-half_w, -half_w], [half_w, -half_w]]],
		[[[0, 0], [-half_w, half_w], [-half_w, -half_w], [half_w, -half_w], [half_w, half_w]]],
		[[[half_w, half_w], [-half_w, half_w], [-half_w, -half_w], [half_w, -half_w]]]
	];

    color("blue")
    linear_extrude(thickness) 
	difference() {
        square(width, center = true);
		for(diff_polygon = diff_polygons[n]) {
		    offset(0.01) polygon(diff_polygon);
		}
	}
	
	color("yellow")
	linear_extrude(thickness / 2)
	    square(width, center = true);
}

module path_tile(n, width) {
    half_w = width / 2;
	quarter_w = width / 4;
	
	module tile1() {
		difference() {
			square(width, center = true);
			circle(quarter_w);
			translate([0, quarter_w])
				square([quarter_w, quarter_w * 2], center = true);
		}
	}
	
	module tile3() {
        difference() {
			square(width, center = true);
			translate([half_w, half_w])
			arc(radius = half_w, angle = [180, 270], width = quarter_w);
		}
	}

	module tile5() {
        difference() {
			square(width, center = true);
			square([quarter_w, width], center = true);
		}
	}
	
	module tile7() {
        intersection() {
			square(width, center = true);
			translate([half_w, half_w])
			    circle(1.5 * quarter_w);
		}
        intersection() {
			square(width, center = true);
			translate([half_w, -half_w])
			    circle(1.5 * quarter_w);
		}
        intersection() {
			square(width, center = true);
			translate([-1.25 * half_w, 0])
                square(width, center = true);
		}
	}
	
	module tile15() {
	    for(i = [0:3]) {
			rotate(90 * i)
			intersection() {
				square(width, center = true);
				translate([half_w, half_w])
					circle(1.5 * quarter_w);
			}
		}
	}
	
	if(n == 0) {
	    square(width, center = true);
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