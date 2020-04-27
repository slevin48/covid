function xticks2string(str,n)
//  Change the xtick to string
//
// Authors
//     Yann Debray - Scilab - ESI Group
//     Inspired by C.L. Tan, Bytecode
//

    a=get("cases_plot_frame");
    aa = a.children.x_ticks;
    tt = round(linspace(1,max(size(str)),n)');
    if size(str,2) > size(str,1)  then
        str = str';
    end
    dd = str(tt);
    aa(2) = tt;
    aa(3) = dd;
    a.children.x_ticks  = aa;
    a.children.user_data = str;

endfunction
