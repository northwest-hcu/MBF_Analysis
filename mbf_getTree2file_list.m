function file_list = mbf_getTree2file_list(dir_path)
    dirs = dir(dir_path);
    file_list = cell(0, 1);
    for d = 1:length(dirs)
        if ~dirs(d).isdir
            file_list{d, 1} = strcat(dirs(d).folder, '/', dirs(d).name);
        end
    end
end