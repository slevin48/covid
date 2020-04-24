function dydt=sir(t, y, bet, gam)
    dydt=[-bet*y(1)*y(2), bet*y(1)*y(2)-gam*y(2), gam*y(2)];
endfunction
