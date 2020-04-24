function SIR_Gui()


	// Window Parameters initialization
	frame_w = 300; frame_h = 550;		// Frame width and height
	plot_w = 600; plot_h = frame_h;	// Plot width and heigh
	axes_w = frame_w + plot_w;	// axes width
	axes_h = frame_h;          	// axes height (100 => toolbar height)
	demo_sir = createWindow();			// Create window with id=100001 and make it the current one

	// Background and text
	demo_sir.figure_name     = gettext("SIR epidemy model");

	// Change dimensions of the figure
	demo_sir.axes_size = [axes_w axes_h];
    demo_sir.resize = "off"

	// Frames creation [parameters]
    font1 = createBorderFont("", 17, "bold");
    b1 = createBorder("titled", createBorder("etched"), "Parameters", "center", "top", font1, "black");
	my_frame = uicontrol(demo_sir, ...
        "relief","groove", ...
		"style","frame", ...
		"position",[0 0 frame_w frame_h], ...
        "border", b1, ...
		"tag","sir_frame_control");

	// Adding model parameters
	guih1 = frame_w;
	guih1o = 180;

	// positioning
	l1 = 30; l2 = 240;

    uicontrol(my_frame, ...
        "style","text",...
        "string","Transmission parameter β", ...
        "position",[l1, guih1-20+guih1o, l2, 20]);

    uicontrol(my_frame, ...
        "style","slider", ...
        "position",[l1,guih1-50+guih1o,l2,30], ...
        "value", 1, ...
        "min", 0.15, ...
        "max", 1, ...
        "sliderstep", [0.1, 30], ...
        "callback", "update_beta_parameter",...
        "tag","beta_slider");

    uicontrol(my_frame, ...
        "style","text",...
        "string","Recovery parameter γ", ...
        "position",[l1,guih1-90+guih1o,l2,20]);

    uicontrol(my_frame, ...
        "style", "slider", ...
        "position",[l1,guih1-120+guih1o,l2,30], ...
        "value", 0.15, ...
        "min", 0, ...
        "max", 1/15, ...
        "sliderstep", [0.1, 30], ...
        "callback", "update_parameter",...
        "tag","gamma_slider");

    // uicontrol(my_frame, ...
    //     "style", "pushbutton", ...
    //     "position",[l1,guih1-260+guih1o,l2,30], ...
    //     "string", "Automatic identification", ...
    //     "callback", "update_parameters", ...
    //     "tag", "btn_optim");

//    uicontrol(my_frame, ...
//        "style", "image", ...
//        "position",[l1,guih1-400+guih1o,l2,96], ...
//        "string", "images\sir.png", ...
//        "tag", "img_model");

    ui_sir_plot_frame = uicontrol(demo_sir, ...
        "style", "frame", ...
		"position",[310 0 plot_w-20 plot_h], ...
        "tag", "sir_plot_frame");

	// Redraw window
	a = newaxes(ui_sir_plot_frame);

    drawlater();
    a.tag = "sir_plot_axes";
	a.title.text            = "SIR epidemy model";
    t=0:.1:100;
    bet=1;   // "min",0.15,"max",0.3
    gam=0.15;  // "min",0,"max",1/15,
    y=ode('stiff',[1;0.001;0],0,t,list(sir,bet,gam));
    plot(t,y)
    drawnow();
endfunction
