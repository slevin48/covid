function update_country()

        // my_plot_axes = gca();
        a=get("cases_plot_frame");

        [header, data] = importdata(covid_getpath()+"\data\time_series_covid19_confirmed_global.csv");
        confirmed = strtod(data(:,5:$));
        country = data(:,2);
        // state = data(:,1);
        c = get("country");
        my = confirmed(country == c.string(c.value),:);
        // x = 1:size(my,'*');
        // plot(x,my)
        a.children(1).children(2).children(1).data(:,2)=my;
        a.children(1).data_bounds=[1,0;93,max(my)];
        a.children(1).children(1).text = c.string(c.value) //legend
        // legend(c.string(c.value),"in_upper_left");
        // disp(y)
endfunction
