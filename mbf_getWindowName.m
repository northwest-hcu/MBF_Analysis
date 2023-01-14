function window_name = mbf_getWindowName(dir_path, cut_count)
    str_array = strsplit(dir_path, {'/', '\'});
    start_index = length(str_array) - cut_count;
    window_name = '';
    for i = 1:length(str_array)
        if i > start_index
            window_name = strcat(window_name, '_', str_array(i));
        end
    end
end