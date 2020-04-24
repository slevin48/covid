function path = covid_getpath()
    path = get_function_path("covid_getpath")
    path = fullpath(fullfile(fileparts(path), ".."))
endfunction
