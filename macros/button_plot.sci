function button_plot()
    a= get("cases_plot_frame").children;
    delete(a.children)
    // eu_countries = ['Germany', 'Italy', 'Spain'];
    [header, data] = importdata(covid_getpath()+"\data\time_series_covid19_confirmed_global.csv");
    confirmed = strtod(data(:,5:$));
    country = data(:,2);
    c = get("country");
    my = confirmed(country == c.string(c.value),:);
    cc = get("country_compared");
    my2 = confirmed(country == cc.string(cc.value),:);

    box = get("compare").Value;
    if box==0 then
        x = 1:size(my,'*');
        plot(x,my);
        xticks2string(header(5:$),10)
        xtitle("Covid-19 Confirmed Cases in "+c.string(c.value),"Date","Cases")
        legend(c.string(c.value),"in_upper_left");
        xgrid()
    elseif (box==1) & (cc.value <> []) then
        x = 1:size(my2,'*');
        plot(x,my,x,my2);
        xticks2string(header(5:$),10)
        xtitle("Covid-19 Confirmed Cases in "+c.string(c.value)+" & "+cc.string(cc.value),"Date","Cases")
        legend([c.string(c.value),cc.string(cc.value)],"in_upper_left");
        xgrid()
    end
endfunction
