function subdemolist = demo_gateway()
    demopath = get_absolute_file_path("covid.dem.gateway.sce");

    subdemolist = ["Welcome Demo", "welcome.dem.sce"];

    subdemolist(:,2) = demopath + subdemolist(:,2);

endfunction

subdemolist = demo_gateway();
clear demo_gateway; // remove demo_gateway on stack
