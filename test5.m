% Projekt 1, zadanie 16
% Borys Kurdek, 320704

close all;
str = "Test numeryczny sprawdzajacy stabilnosc metody Milne'a" +  newline + ...
    "Test ten bedzie polegal rozwiazaniu rr. z rownaniem sztywnym" + newline +...
    "oraz porownaniu wartosci bledu dla rosnacych ilosci punktow";
disp(str);

fun1 = @(x) (1-8*x)./exp(4*x);
str_eq1 = "rownanie  y'' + 8y' + 16y = 0, y(0) = 1 , y'(0) = -12";

A1 = {@(x) 16, @(x) 8, @(x) 1};
b01 = @(x) 0;
C1 = [1;-12];
a1 = 0; b1 = 15; n1 =100;

disp(str_eq1)
fprintf("a = %.2f, b=%.2f, n_start = %.2f\n",a1,b1,n1)
iter_max = 50;
% alokacja pamieci na wektory bledow
err_m = zeros(iter_max,1);
err_r = zeros(iter_max,1);
iter = 1:iter_max;
for i = 1 : iter_max
    err_m(i) = max(error_calc_f(A1,b01,C1,a1,b1,i*n1,fun1,'M',0), ...
        [],'ComparisonMethod','abs');
    err_r(i) = max(error_calc_f(A1,b01,C1,a1,b1,i*n1,fun1,'R',0), ...
        [],'ComparisonMethod','abs');
end
% rysowanie wykresu max err
figure
title('wykres max err od ilosci punktow')
xlabel('n')
ylabel('max err')
hold on
plot(n1 * iter,err_m,'r');
plot(n1 * iter,err_r,'g');
hold off
legend("Milne","Runge");

% rysowanie wykresu dla dokladnego, 100pkt i 1000pkt
[x1,y1] = P1Z16_BKU_Milne(A1,b01,C1,a1,b1,n1);
[x2,y2] = P1Z16_BKU_Milne(A1,b01,C1,a1,b1,10 * n1);

figure
title(str_eq1)
xlabel('x')
ylabel('y(x)')
hold on
plot(x2,fun1(x2),'r')
plot(x2,y2,'g');
plot(x1,y1,'b');
hold off
legend("dokladne","100pkt","1000pkt");
