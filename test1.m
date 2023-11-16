% Projekt 1, zadanie 16
% Borys Kurdek, 320704
str = "Test dokladnosci metody Milne" + newline;
disp(str);

str_max_err = "Maksymalny blad dla tego rownanania i danych arg wynosi: ";
% test 1
input("");
% wpisanie danych
str_eq1 = "rownanie ddy + dy - 2y == 4x,  y(0) = 0, y'(0) = 0";
fun1 = @(x) 4/3*exp(x) - 1./(3*exp(2*x)) - 2*x - 1;

A1 = {@(x) -2, @(x) 1, @(x) 1};
b01 = @(x) 4*x;
C1 = [0;0];
a1 = 0; b1 = 3; n1 =200;

disp(str_eq1)
disp(str_max_err)
% obliczenie bledow dla roznych parametrow
error_calc_f(A1,b01,C1,a1,b1,n1,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1,n1/2,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1/2,n1/2,fun1,'M',1);

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
disp(str_max_err)
% obliczenie bledow dla roznych parametrow
error_calc_f(A1,b01,C1,a1,b1,n1,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1,n1/2,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1/2,n1/2,fun1,'M',1);

% test 3
input("");
% wpisanie danych
str_eq1 = "rownanie ddy + y == 0, y(0) = 0, y'(0) = 1/pi";
fun1 = @(x) sin(x)/pi;

A1 = {@(x)1, @(x) 0, @(x) 1};
b01 = @(x) 0;
C1 = [0;1/pi];
a1 = 0; b1 = 3; n1 =100;

disp(str_eq1)
disp(str_max_err)
% obliczenie bledow dla roznych parametrow
error_calc_f(A1,b01,C1,a1,b1,n1,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1,n1/2,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1/2,n1/2,fun1,'M',1);

%test 4
input(" ")
% wpisanie danych
str_eq1 = "rownanie 2ddy - dy == 4x, y(1) = 2, y'(1) = 2";
fun1 = @(x) 28 * exp(x./2 - 1/2) - 2* x.^2 - 8 * x - 16;

A1 = {@(x)0, @(x) -1, @(x) 2};
b01 = @(x) 4*x;
C1 = [2;2];
a1 = 1; b1 = 3; n1 =500000;

disp(str_eq1)
disp(str_max_err)
% obliczenie bledow dla roznych parametrow
error_calc_f(A1,b01,C1,a1,b1,n1,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1,n1/2,fun1,'M',1);
error_calc_f(A1,b01,C1,a1,b1/2,n1/2,fun1,'M',1);
