function update_compared()
    a=get("cases_plot_frame");

    [header, data] = importdata(covid_getpath()+"\data\time_series_covid19_confirmed_global.csv");
    confirmed = strtod(data(:,5:$));
    country = data(:,2);
    // state = data(:,1);
    c = get("country");
    my = confirmed(country == c.string(c.value),:);
    cc = get("country_compared");
    my2 = confirmed(country == cc.string(cc.value),:);
    // x = 1:size(my2,'*');
    // plot(x,my,x,my2);
    // xticks2string(header(5:$),10)
    // xtitle("Covid-19 Confirmed Cases in Malaysia & Singapore","Date","Cases")
    // xgrid()
    // legend("Malaysia","Singapore",2);
endfunction
