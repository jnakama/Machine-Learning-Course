#A= [ 1 1 ; 1 1]

#disp(sigmoid(-999));
#disp(sigmoid(A));



data = load('ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

[m, n] = size(X);



X = [ones(m, 1) X];

initial_theta = zeros(n + 1, 1);


disp(X);

fprintf("y is ");
disp(y);

fprintf("theta is  ");
disp(initial_theta);

fprintf(" X*y is  /n");
disp(X.*y);
