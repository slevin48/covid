
function app_launcher()

    if exists("defaultFontProperties") then
        defaultFontProperties("Lato", "normal", 13, "normal", "pixels");
    end


	demo_app = createWindow();			// Create window with id=100001 and make it the current one

	// Background and text
	demo_app.figure_name     = gettext("Covid-19 Apps");
    demo_app.visible = "off";
    demo_app.resize = "off"

    btns = [ ...
        "Covid-19 cases", "Cases_Gui"; ...
        // "Histogram", "Hist_Gui"; ...
        // "LHY model", "LHY_Color_Gui"; ...
        // "System identification", "System_Gui"; ...
        // "Bubble sort", "Bubble_Gui"; ...
        // "Weather dashboard", "Dashboard_Gui"; ...
        "SIR model", "SIR_Gui"; ...
    ];
    btnCount = size(btns, "r");

	// Change dimensions of the figure
    w = 300;
    h = 50 + 50 * size(btns, "r") + 20;
	demo_app.axes_size = [w h];


	// Frames creation
    font1 = createBorderFont("", 17, "bold");
    b1 = createBorder("titled", createBorder("etched"), "Demos", "center", "top", font1, "black");
	launcher_frame = uicontrol(demo_app, ...
		"style","frame", ...
		"position", [0 0 w h], ...
        "border", b1);

	// Adding buttons
    for i = 1:btnCount
        uicontrol(launcher_frame, ...
            "style","pushbutton", ...
            "Position",[60 (-30 + (i*50)) 180 30], ...
            "String", btns(i, 1), ...
            "Callback", btns(i, 2));
    end

    demo_app.visible = "on";
endfunction
