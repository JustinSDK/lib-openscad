use <unittest.scad>;
use <voxel/vx_polygon.scad>;

module test_vx_polygon() { 
    echo("==== test_vx_polygon ====");

    expected = [[-5, -10], [-5, -9], [-4, -9], [-6, -8], [-4, -8], [-6, -7], [-3, -7], [-6, -6], [-3, -6], [-7, -5], [-2, -5], [-7, -4], [-2, -4], [-7, -3], [-1, -3], [-8, -2], [-1, -2], [-8, -1], [0, -1], [-8, 0], [0, 0], [-9, 1], [1, 1], [-9, 2], [1, 2], [-9, 3], [2, 3], [-10, 4], [2, 4], [-10, 5], [-9, 5], [3, 5], [-8, 6], [-7, 6], [-6, 6], [3, 6], [-5, 7], [-4, 7], [-3, 7], [4, 7], [-2, 8], [-1, 8], [0, 8], [4, 8], [1, 9], [2, 9], [3, 9], [5, 9], [4, 10], [5, 10]];
    actual = vx_polygon([[5, 10], [-10, 5], [-5, -10]], false); 
    assertEqualPoints(expected, actual);

    expected2 =  [[-6, 6], [0, 8], [-1, -1], [-5, 1], [-8, 3], [-3, 4], [2, 5], [-1, 7], [-3, -7], [-7, -3], [-8, -2], [0, -1], [-9, 3], [3, 5], [-7, 6], [-4, -6], [-5, -5], [-6, -4], [-6, 1], [-1, 2], [0, 3], [-4, 4], [-2, 7], [1, 8], [-8, 6], [-3, 7], [-2, -3], [-3, -2], [-4, -1], [-7, 1], [-2, 2], [1, 3], [-5, 4], [2, 8], [-4, -9], [-6, -7], [2, 3], [-10, 5], [-4, 7], [-5, -8], [-8, 1], [-3, 2], [-6, 4], [-1, 5], [0, 6], [3, 8], [-9, 1], [-5, 7], [4, 8], [5, 10], [-3, -5], [-4, -4], [-5, -3], [-6, -2], [-7, -1], [-1, 0], [0, 1], [-4, 2], [-7, 4], [-2, 5], [1, 6], [-1, -2], [1, 1], [-1, 8], [-2, -1], [-2, 0], [-5, 2], [-8, 4], [-3, 5], [2, 6], [-7, -4], [3, 6], [-2, 8], [1, 9], [-4, -7], [-5, -6], [-6, -5], [-3, 0], [-6, 2], [-1, 3], [-9, 4], [0, 4], [-4, 5], [-5, -10], [-2, -4], [2, 9], [-3, -3], [-4, -2], [-5, -1], [-4, 0], [-7, 2], [-2, 3], [1, 4], [-5, 5], [-5, -9], [-6, -8], [2, 4], [3, 9], [-5, 0], [-8, 2], [-3, 3], [-6, 5], [-1, 6], [0, 7], [-3, -6], [-8, -1], [-9, 2], [-4, -5], [-5, -4], [-6, -3], [-7, -2], [-6, 0], [-1, 1], [0, 2], [-4, 3], [-7, 5], [-2, 6], [1, 7], [4, 9], [-1, -3], [1, 2], [5, 9], [-2, -2], [-3, -1], [-7, 0], [-2, 1], [-5, 3], [-8, 5], [-3, 6], [2, 7], [-4, -8], [-6, -6], [-7, -5], [-8, 0], [-10, 4], [-9, 5], [-5, -7], [-3, 1], [-6, 3], [-1, 4], [0, 5], [-4, 6], [3, 7], [-2, -5], [0, 0], [4, 7], [4, 10], [-3, -4], [-4, -3], [-5, -2], [-6, -1], [-4, 1], [-7, 3], [-2, 4], [1, 5], [-5, 6]];
    actual2 = vx_polygon([[5, 10], [-10, 5], [-5, -10]], true); 
    assertEqualPoints(expected2, actual2);
}

test_vx_polygon();