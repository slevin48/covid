function update_country()

        eu_countries = ['Germany', 'Italy', 'Spain'];
        // [header, data] = importdata(covid_getpath()+"\data\time_series_covid19_confirmed_global.csv");
        // confirmed = strtod(data(:,5:$));
        // country = data(:,2);
        c = get("country");
        // a=get("cases_plot_frame");
        // my = confirmed(country == c.string(c.value),:);
        // a.children(1).children(2).children(1).data(:,2)=my;
        // a.children(1).data_bounds=[1,0;93,max(my)];
        // a.children(1).children(1).text = c.string(c.value) //legend

        // update list of countries to compare with
        set("country_compared","string",eu_countries(eu_countries <> c.string(c.value)))
        set("country_compared","value",1)
endfunction
