function file_list = mbf_dir2file_list(dir_path)
    addpath(dir_path);
    files = dir(strcat(dir_path, '/*.txt'));
    file_list = cell(length(files), 1);
    for i=1:length(files)
        file_list{i, 1} = strcat(files(i).folder, '/', files(i).name);
    end
end