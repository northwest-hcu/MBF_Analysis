function selected_file_list = mbf_getInnerThreshold(file_list, threshold, center, move_range)
    file_length = length(file_list);
    selected_file_list = cell(0, 1);
    % ファイルごとに閾値を超えていなければ返り値に入れていく
    for i=1:file_length
        data = mbf_loadData(file_list{i, 1}, move_range); % データの読み込み
        if max(data.values) > threshold + center
            disp(strcat(file_list{i, 1}, ' is over upper threshold.'));
            disp(strcat('max value is ', num2str(max(data.values))));
        elseif min(data.values) < (threshold * (-1)) + center
            disp(strcat(file_list{i, 1}, ' is over lower threshold.'));
            disp(strcat('min value is ', num2str(min(data.values))));
        else
            selected_file_list{height(selected_file_list) + 1, 1} = file_list{i, 1};
        end
    end
end