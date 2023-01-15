function dir_list = mbf_getTree2dir_list(dir_path)
    dirs = dir(dir_path);
    dir_list = cell(0, 1);
    for d = 1:length(dirs)
        index_dir = dir(strcat(dirs(d).folder, '/', dirs(d).name, '/*.txt'));
        if isempty(index_dir)
            continue;
        end
        if dirs(d).isdir && ~strcmp(dirs(d).name, '.') && ~strcmp(dirs(d).name, '..')
            dir_list{height(dir_list) + 1, 1} = strcat(dirs(d).folder, '/', dirs(d).name);
        end
    end
end