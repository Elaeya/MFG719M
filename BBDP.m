% Define Food Items
x1 = optimvar('Rice', 'LowerBound', 0, 'UpperBound', Inf);
x2 = optimvar('Oats', 'LowerBound', 0, 'UpperBound', Inf);
x3 = optimvar('Potatoes', 'LowerBound', 0, 'UpperBound', Inf);
x4 = optimvar('Bread', 'LowerBound', 0, 'UpperBound', Inf);
y1 = optimvar('Chicken', 'LowerBound', 0, 'UpperBound', Inf);
y2 = optimvar('Eggs', 'LowerBound', 0, 'UpperBound', Inf);
y3 = optimvar('Fish', 'LowerBound', 0, 'UpperBound', Inf);
y4 = optimvar('Beef', 'LowerBound', 0, 'UpperBound', Inf);
w1 = optimvar('Almonds', 'LowerBound', 0, 'UpperBound', Inf);
w2 = optimvar('Walnuts', 'LowerBound', 0, 'UpperBound', Inf);
w3 = optimvar('PB', 'LowerBound', 0, 'UpperBound', Inf);
w4 = optimvar('Avocado', 'LowerBound', 0, 'UpperBound', Inf);

% Define Objective Function
prob = optimproblem('Objective', 5.3*x1 + 17.44*x2 + 12.1*x3 + 9*x4 + ...
    37.4*y1 + 21.3*y2 + 16*y3 + 31.2*y4 + 143.13*w1 + 142.14*w2 + ...
    25.74*w3 + 16.6*w4, 'ObjectiveSense', 'min');

% Define Constraints
prob.Constraints.c1 = 130*x1 + 379*x2 + 92*x3 + 300*x4 + ...
    165*y1 + 140*y2 + 148*y3 + 163*y4 + 579*w1 + 654*w2 + ...
    598*w3 + 160*w4 == 3450;
prob.Constraints.c2 = 29*x1 + 68*x2 + 21*x3 + 56*x4 + ...
    0*y1 + 0*y2 + 0*y3 + 0*y4 + 22*w1 + 14*w2 + ...
    22*w3 + 9*w4 <= 518;
prob.Constraints.c3 = 29*x1 + 68*x2 + 21*x3 + 56*x4 + ...
    0*y1 + 0*y2 + 0*y3 + 0*y4 + 22*w1 + 14*w2 + ...
    22*w3 + 9*w4 >= 474;
prob.Constraints.c4 = 2*x1 + 13*x2 + 2*x3 + 10*x4 + ...
    31*y1 + 12*y2 + 21*y3 + 23*y4 + 21*w1 + 15*w2 + ...
    22*w3 + 2*w4 <= 302;
prob.Constraints.c5 = 2*x1 + 13*x2 + 2*x3 + 10*x4 + ...
    31*y1 + 12*y2 + 21*y3 + 23*y4 + 21*w1 + 15*w2 + ...
    22*w3 + 2*w4 >= 259;
prob.Constraints.c6 = 0.2*x1 + 6.5*x2 + 0.2*x3 + 4*x4 + ...
    3.6*y1 + 10*y2 + 6.7*y3 + 7.2*y4 + 49.9*w1 + 65.2*w2 + ...
    51.4*w3 + 14.7*w4 <= 77;
prob.Constraints.c7 = 0.2*x1 + 6.5*x2 + 0.2*x3 + 4*x4 + ...
    3.6*y1 + 10*y2 + 6.7*y3 + 7.2*y4 + 49.9*w1 + 65.2*w2 + ...
    51.4*w3 + 14.7*w4 >= 58;

% Solve
[sol, fval] = solve(prob)