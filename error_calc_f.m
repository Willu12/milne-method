function [err] = error_calc_f(A,b0,C,a,b,n,fun,W,P)
% funkcja pomocznicza do testerek, wylicza błąd dla danego równania
% na podstawie metody Rungego-kutty badz Milne
% parametry A - n analogicznie jak w Milne
% f - uchywt do funkcji bedacej rozw. rownania
% W - 'R' or 'M'  - wybor czy milne czy Runge
% opcjonalny argument wypisuje w tabeli argumenty i max_err

if(W == 'R')
    [x,y,~,~] = Runge(A,b0,C,a,b,n);
else
    [x,y,~,~] = P1Z16_BKU_Milne(A,b0,C,a,b,n);
end

err = abs(fun(x) - y);

if(P == 1)
colnames = {'a','b','n','max_err'};
c = table(a, b, n,max(err),'VariableNames', colnames);
disp(c)
end
end

