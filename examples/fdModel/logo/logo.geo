cl__1 = 1;
Point(1) = {0.000000e+00, 0.000000e+00, 0, 2.500000e-02};
Point(2) = {0.000000e+00, 1.500000e+00, 0, 2.500000e-02};
Point(3) = {2.500000e-01, 0.000000e+00, 0, 2.500000e-02};
Point(4) = {2.500000e-01, 1.000000e+00, 0, 2.500000e-02};
Point(5) = {2.500000e-01, 1.500000e+00, 0, 2.500000e-02};
Point(6) = {7.500000e-01, 0.000000e+00, 0, 2.500000e-02};
Point(7) = {7.500000e-01, 5.000000e-01, 0, 2.500000e-02};
Point(8) = {7.500000e-01, 1.500000e+00, 0, 2.500000e-02};
Point(9) = {1.000000e+00, 1.500000e+00, 0, 2.500000e-02};
Point(10) = {1.000000e+00, 2.500000e-01, 0, 2.500000e-02};
Point(11) = {1.500000e+00, 2.500000e-01, 0, 2.500000e-02};
Point(12) = {1.500000e+00, 1.500000e+00, 0, 2.500000e-02};
Point(13) = {1.750000e+00, 0.000000e+00, 0, 2.500000e-02};
Point(14) = {1.750000e+00, 1.000000e+00, 0, 2.500000e-02};
Point(15) = {1.750000e+00, 1.500000e+00, 0, 2.500000e-02};
Point(16) = {2.125000e+00, 2.500000e-01, 0, 2.500000e-02};
Point(17) = {2.125000e+00, 7.500000e-01, 0, 2.500000e-02};
Point(18) = {2.500000e+00, 0.000000e+00, 0, 2.500000e-02};
Point(19) = {2.750000e+00, 0.000000e+00, 0, 2.500000e-02};
Point(20) = {2.500000e+00, 1.000000e+00, 0, 2.500000e-02};
Point(21) = {2.500000e+00, 1.500000e+00, 0, 2.500000e-02};
Point(22) = {2.750000e+00, 1.500000e+00, 0, 2.500000e-02};
Line(1) = {1, 2};
Line(2) = {2, 5};
Line(3) = {5, 7};
Line(4) = {7, 8};
Line(5) = {8, 9};
Line(6) = {9, 10};
Line(7) = {10, 11};
Line(8) = {11, 12};
Line(9) = {12, 15};
Line(10) = {15, 17};
Line(11) = {17, 21};
Line(12) = {21, 22};
Line(13) = {22, 19};
Line(14) = {19, 18};
Line(15) = {18, 20};
Line(16) = {20, 16};
Line(17) = {16, 14};
Line(18) = {14, 13};
Line(19) = {13, 6};
Line(20) = {6, 4};
Line(21) = {4, 3};
Line(22) = {3, 1};
Line Loop(1) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22};
Plane Surface(1) = {1};
