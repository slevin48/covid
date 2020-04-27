function update_parameter()

        // my_plot_axes = gca();
        bet = get("beta_slider","value");
        gam = get("gamma_slider","value");
        a=get("sir_plot_axes");
        t=0:.1:100;
        // bet=1;   // "min",0.15,"max",0.3
        // gam=0.15;  // "min",0,"max",1/15,
        y=ode('stiff',[1;0.001;0],0,t,list(sir,bet,gam));
        // a.children(1) --> legend
        a.children(2).children(1).data(:,2)=y(1,:)';
        a.children(2).children(2).data(:,2)=y(2,:)';
        a.children(2).children(3).data(:,2)=y(3,:)';
        // disp(y)
endfunction
