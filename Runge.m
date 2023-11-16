function [x,y,dy,ddy] = Runge(A,b0,C,a,b,n,max_iter)
% Projekt 1, zadanie 16
% Borys Kurdek, 320704
%
% Rozwiazywanie liniowych rownan rozniczkowych drugiego rzedu z
% metoda Rungego-Kutty rzedu 4-go (wzor "3/8").
% Wejscie:
%   A - cell array uchwytow do funkcji a(x) przy kolejnych pochodnych y
%   jej i-ty element odpowiada funkcji przy (i-1) pochodnej y
%   b0 - uchwyt do funkcji po prawej stronie rownania rozniczkowego
%   C - wektor kolumnowy warunkow poczatkowych [y(a); y'(a)]
%   a - poczatek przedzialu
%   b - koniec przedzialu
%   n - liczba krokow na naszym przedziale
%   max_iter - opcjonalny argument okreslajacy ilosc poczatkowych wartosci,
%   ktore chcemy wyznaczyc (niewyliczone wartosci beda miec wartosc 0)
% Wyjscie:
%   x - wektor kolejnych xi (gdzie xi = a + i * h, i = 0,1,2,...n),
%   y - wektor wyznaczanych wartosci dla funkcji y (y(i) = y(x(i)))
%   dy - wektor wyznaczanych wartosci dla funkcji y' (y'(i) = y'(x(i)))
%   ddy - wektor wyznaczanych wartosci dla funkcji y'' (y''(i) = y''(x(i)))

if(nargin < 7)
    max_iter = n - 1;
end

h = (b - a)/(n - 1); % wyznaczenie dlugosci kroku

% alokacja pamieci na zwracane wektory
x = zeros(n, 1);
y = zeros(n, 1);
dy = zeros(n, 1);
ddy = zeros(n, 1);

% przypisanie wartosci poczatkowych
x(1) = a;
y(1) = C(1);
dy(1) = C(2);

Y = [a;C]; % wektor uzywany do wyznaczania kolejnych wartosci

% wyznaczenie pierwszych max_iter wartosci
for i = 2 : max_iter + 1

    % obliczenie wszystkich K
    K0 = F(Y, A, b0);
    K1 = F(Y + h * 1/3 * K0, A, b0);
    K2 = F(Y + h * ((-1/3) * K0 + K1), A, b0);
    K3 = F(Y + h * (K0 - K1 + K2),A,b0);

    % wyznaczenie xi,yi,dyi dla 
    Y = Y + h/8 *(K0 + 3*K1 + 3*K2 + K3);

    % przepisanie wartosci do zwracanych wektorow
    [x(i), y(i), dy(i)] = deal(Y(1), Y(2), Y(3));
    ddy(i-1) = K0(3);
end
end