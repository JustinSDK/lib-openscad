# ptf_y_twist

Twist a point along the y-axis. You can use it to create something such as a [twisted maze](https://github.com/JustinSDK/dotSCAD/blob/master/examples/maze/twisted_maze.scad).

![ptf_y_twist](images/lib3x-ptf_y_twist-2.JPG)

**Since:** 2.3

## Parameters

- `size` : 2 value array `[x, y]`, rectangle with dimensions `x` and `y`.
- `point` : The point to be twisted.
- `angle` : The number of degrees.

## Examples

    use <hull_polyline3d.scad>;
    use <ptf/ptf_y_twist.scad>;

    size = [10, 20];

    rows = [
        for(y = [0:size[1]])
            [for(x = [0:size[0]]) [x, y]]
    ];

    columns = [
        for(x = [0:size[0]])
            [for(y = [0:size[1]]) [x, y]]
    ];

    for(line = rows) {
        twisted = [for(p = line) ptf_y_twist(size, p, 90)];
        hull_polyline3d(twisted, thickness = .1);
    }

    for(line = columns) {
        twisted = [for(p = line) ptf_y_twist(size, p, 90)];
        hull_polyline3d(twisted, thickness = .1);
    }

![ptf_y_twist](images/lib3x-ptf_y_twist-1.JPG)
