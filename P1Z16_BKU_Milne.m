function [x,y,dy,ddy] = P1Z16_BKU_Milne(A,b0,C,a,b,n)
% Projekt 1, zadanie 16
% Borys Kurdek, 320704
%
% Rozwiazywanie liniowych rownan rozniczkowych drugiego rzedu z
% metoda Milne'a
% Poczatkowe wartosci y1,y2,y3 wyznaczane beda przy pomocy metody
% Rungego-Kutty rzedu 4-go (wzor "3/8").
% Wejscie:
%   A - cell array uchwytow do funkcji a(x) przy kolejnych pochodnych y
%   jej i-ty element odpowiada funkcji przy (i-1) pochodnej y
%   b0 - uchwyt do funkcji po prawej stronie rownania rozniczkowego
%   C - wektor kolumnowy warunkow poczatkowych [y(a); y'(a)]
%   a - poczatek przedzialu
%   b - koniec przedzialu
%   n - liczba krokow na naszym przedziale
% Wyjscie:
%   x - wektor kolejnych xi (gdzie xi = a + i * h, i = 0,1,2,...n),
%   y - wektor wyznaczanych wartosci dla funkcji y (y(i) = y(x(i)))
%   dy - wektor wyznaczanych wartosci dla funkcji y' (y'(i) = y'(x(i)))
%   ddy - wektor wyznaczanych wartosci dla funkcji y'' (y''(i) = y''(x(i)))

h = (b-a)/(n-1);    % wyznaczenie dlugosci kroku

% wyznaczenie y1, y2, y3 przy pomocy metody Rungego-Kutty
[x,y,dy,ddy] = Runge(A,b0,C,a,b,n,3);

% dalsze wyznaczanie przy pomocy metody Milne'a
for i = 5 : n
    x(i) = x(i-1) + h;

    % wyznaczenie wartosci drugiej pochodnej dla xi-1
    ddy(i-1) = (b0(x(i-1)) - A{1}(x(i-1)) * y(i-1) - A{2}(x(i-1)) ...
        * dy(i-1)) / A{3}(x(i-1));

    % obliczenie predyktora
    y(i) = y(i-4) + 4/3 * h * (2 * dy(i-1) - dy(i-2) + 2 * dy(i-3));
    dy(i) = dy(i-4) + 4/3 * h * (2 * ddy(i-1) - ddy(i-2) + 2 * ddy(i-3));

    % wyznaczenie przewidywanej wartosci drugiej pochodnej w xi
    ddy(i) = (b0(x(i)) - A{1}(x(i)) * y(i) - A{2}(x(i)) * dy(i)) ...
        /A{3}(x(i));

    % poprawa korektorem
    y(i) = y(i-2) + 1/3 * h * (dy(i-2) + 4 * dy(i-1) + dy(i));
    dy(i) = dy(i-2) + 1/3 * h * (ddy(i-2) + 4 * ddy(i-1) + ddy(i));
end
end
