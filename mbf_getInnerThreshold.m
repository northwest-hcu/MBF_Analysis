function selected_file_list = mbf_getInnerThreshold(file_list, threshold, center, move_range)
    file_length = length(file_list);
    selected_file_list = cell(0, 1); 
    for i=1:file_length
        data = mbf_loadData(file_list{i, 1}, move_range); % データの読み込み
        if max(data.values) > threshold + center
            disp(strcat(file_list{i, 1}, ' is over upper threshold.'));
        elseif min(data.values) < (threshold * (-1)) + center
            disp(strcat(file_list{i, 1}, ' is over lower threshold.'));
        else
            selected_file_list{height(selected_file_list) + 1, 1} = file_list{i, 1};
        end
    end
end