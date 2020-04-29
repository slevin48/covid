function update_checkbox()
    c = get("compare").Value;
    if c==0 then
        set("country_compared","enable","off")
    else
        set("country_compared","enable","on")
    end
endfunction
