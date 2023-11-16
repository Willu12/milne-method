% Projekt 1, zadanie 16
% Borys Kurdek, 320704
str = "Test sprawdzajacy metody Milne'a " + ...
    "jest 4 rzedu." + newline + ...
    "Test ten bedzie polegal na porownaniu zmiany bledu globalnego"+newline+"dla coraz mniejszych h." + newline;
disp(str);

str_order = "Rzad dla danych arg wynosi: ";

% test 1
input("");
% wpisanie danych
str_eq1 = "rownanie ddy + dy - 2y == 4x,  y(0) = 0, y'(0) = 0";
fun1 = @(x) 4/3*exp(x) - 1./(3*exp(2*x)) - 2*x - 1;
A1 = {@(x) -2, @(x) 1, @(x) 1};
b01 = @(x) 4*x;
C1 = [0;0];
a1 = 0; b1 = 1; n1 =100;

disp(str_eq1)
disp(str_order)
fprintf("a = %.2f, b=%.2f, n_start = %.2f\n",a1,b1,n1)
global_order_pred_f(A1,b01,C1,a1,b1,n1,fun1,'M',1); % szacowanie rzedu

% test 2
input("");
% wpisanie danych
str_eq1 = "rownanie ddy -  dy == 2(1-x),  y(0) = 2, y'(0) = 2";
fun1 = @(x) 2 .* exp(x) + x.^2;
A1 = {@(x) 0, @(x) -1, @(x) 1};
b01 = @(x) 2 * (1-x);
C1 = [2;2];
a1 = 0; b1 = 2; n1 =100;

disp(str_eq1)
disp(str_order)
fprintf("a = %.2f, b=%.2f, n_start = %.2f\n",a1,b1,n1)
global_order_pred_f(A1,b01,C1,a1,b1,n1,fun1,'M',1); % szacowanie rzedu

% test 3
input("");
% wpisanie danych
str_eq1 = "rownanie ddy + y == 0, y(0) = 0, y'(0) = 1/pi";
fun1 = @(x) sin(x)/pi;
A1 = {@(x)1, @(x) 0, @(x) 1};
b01 = @(x) 0;
C1 = [0;1/pi];
a1 = 0; b1 = 5; n1 =100;

disp(str_eq1)
disp(str_order)
fprintf("a = %.2f, b=%.2f, n_start = %.2f\n",a1,b1,n1)
global_order_pred_f(A1,b01,C1,a1,b1,n1,fun1,'M',1); % szacowanie rzedu