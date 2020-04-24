function Cases_Gui()

	// Window Parameters initialization
	frame_w = 300; frame_h = 550;		// Frame width and height
	plot_w = 600; plot_h = frame_h;	// Plot width and heigh
	axes_w = frame_w + plot_w;	// axes width
	axes_h = frame_h;          	// axes height (100 => toolbar height)
	demo_cases = createWindow();			// Create window with id=100001 and make it the current one

	// Background and text
	demo_cases.figure_name     = gettext("Covid-19 cases");

	// Change dimensions of the figure
	demo_cases.axes_size = [axes_w axes_h];
    demo_cases.resize = "off"

	// Frames creation [parameters]
    font1 = createBorderFont("", 17, "bold");
    b1 = createBorder("titled", createBorder("etched"), "Parameters", "center", "top", font1, "black");
	my_frame = uicontrol(demo_cases, ...
        "relief","groove", ...
		"style","frame", ...
		"position",[0 0 frame_w frame_h], ...
        "border", b1, ...
		"tag","cases_frame_control");

	// Adding model parameters
	guih1 = frame_w;
	guih1o = 180;

	// positioning
	l1 = 30; l2 = 240;
    //
    // uicontrol(my_frame, ...
    //     "style","text",...
    //     "string","Proportional parameter K", ...
    //     "position",[l1, guih1-20+guih1o, l2, 20]);
    //
    // uicontrol(my_frame, ...
    //     "style","slider", ...
    //     "position",[l1,guih1-50+guih1o,l2,30], ...
    //     "value", 1, ...
    //     "min", 0.1, ...
    //     "max", 1.5, ...
    //     "sliderstep", [0.1, 30], ...
    //     "callback", "update_K_parameter",...
    //     "tag","K_slider");
    //
    // uicontrol(my_frame, ...
    //     "style","text",...
    //     "string","First order parameter Tau", ...
    //     "position",[l1,guih1-90+guih1o,l2,20]);
    //
    // uicontrol(my_frame, ...
    //     "style", "slider", ...
    //     "position",[l1,guih1-120+guih1o,l2,30], ...
    //     "value", 1, ...
    //     "min", 0, ...
    //     "max", 1.5, ...
    //     "sliderstep", [0.1, 30], ...
    //     "callback", "update_Tau_parameter",...
    //     "tag","Tau_slider");
    //
    // uicontrol(my_frame, ...
    //     "style","text",...
    //     "string","Second order parameter Tau2", ...
    //     "position",[l1,guih1-160+guih1o,l2,20]);
    //
    // uicontrol(my_frame, ...
    //     "style", "slider", ...
    //     "position",[l1,guih1-190+guih1o,l2,30], ...
    //     "value", 1, ...
    //     "min", 0, ...
    //     "max", 1.5, ...
    //     "sliderstep", [0.1, 30], ...
    //     "callback", "update_Tau2_parameter",...
    //     "tag","Tau2_slider");
    //
    // uicontrol(my_frame, ...
    //     "style", "pushbutton", ...
    //     "position",[l1,guih1-260+guih1o,l2,30], ...
    //     "string", "Automatic identification", ...
    //     "callback", "update_parameters", ...
    //     "tag", "btn_optim");

//    uicontrol(my_frame, ...
//        "style", "image", ...
//        "position",[l1,guih1-400+guih1o,l2,96], ...
//        "string", "images\cases.png", ...
//        "tag", "img_model");

    ui_cases_plot_frame = uicontrol(demo_cases, ...
        "style", "frame", ...
		"position",[310 0 plot_w-20 plot_h], ...
        "tag", "cases_plot_frame");

	// Redraw window
	a = newaxes(ui_cases_plot_frame);

    drawlater();
    [header, data] = importdata(covid_getpath()+"\data\time_series_covid19_confirmed_global.csv");

    confirmed = strtod(data(:,5:$));
    country = data(:,2);
    state = data(:,1);

    my = confirmed(country == "Germany",:);
    x = 1:size(my,'*');
    plot(x,my)
    // xticks2string(header(5:$),10)
    xtitle("German Covid-19 Confirmed Cases","Date","Cases")
    xgrid()
    drawnow();
endfunction
