function [out] = F(Y,A,b0)
% Projekt 1, zadanie 16
% Borys Kurdek, 320704
%
% funkcja pomocnicza do metody Rungego - Kutty
% Wejscie:
%   A - cell array uchwytow do funkcji a(x) przy kolejnych pochodnych y
%   jej i-ty element odpowiada funkcji przy (i-1) pochodnej y
%   b0 - uchwyt do funkcji po prawej stronie rownania rozniczkowego
%   Y - wektor ostatnich oszacowanych wartosci [x,y,dy]

% na podstawie rownania wylicza kolejne oszacowanie wektora Y
out = [1;Y(3);(b0(Y(1)) - A{1}(Y(1)) * Y(2) - A{2}(Y(1)) * Y(3))...
    /A{3}(Y(1))];

end