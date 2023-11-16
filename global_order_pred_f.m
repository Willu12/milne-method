function [ord] = global_order_pred_f(A,b0,C,a,b,n,f,W,P)
% funkcja pomocznicza do testerek, szacuje rzad globalny metody dla 
% danego rownania
% na podstawie metody Rungego-kutty badz Milne
% parametry A - n analogicznie jak w Milne
% f - uchywt do funkcji bedacej rozw. rownania
% W - 'R' lub 'M'  - wybor czy milne czy Runge
% P -  opcjonalny argument, gdy P = 1 wypisuje wyniki do tabeli

% funkcja pomocnicza tworzaca logarytm o podstawie b
log_b = @(x,base) log(x)/log(base);

err_max = ones(1,10);
err_app = ones(1,10);
h = 1:10;
h = (b-a)./(n*h - 1);
ord = ones(1,10);
sizes = 1:10;
err_max(1) =  max(error_calc_f(A,b0,C,a,b,n,f,W,0),[], ...
    'ComparisonMethod','abs');

for i = 2 : 10
    err_max(i) = max(error_calc_f(A,b0,C,a,b,i*n,f,W,0));
    err_app(i) = err_max(1)/err_max(i);
    ord(i) = log_b(err_app(i),i);
end

if(P == 1)
    colnames = {'mnoznik N','wartosc h','uzyskany stosunek','oszacowany rzad'};
    c = table(sizes(2:10)', h(2:10)', err_app(2:10)', ord(2:10)', ...
        'VariableNames', colnames);
    disp(c);
    fprintf("sredni oszacowany rzad: %2f\n", mean(ord(2:10)));
end





end

