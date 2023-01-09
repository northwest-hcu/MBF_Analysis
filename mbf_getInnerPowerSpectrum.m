function file_lists = mbf_getInnerPowerSpectrum(file_list, threshold, frequency_range, move_range)
    file_length = length(file_list);
    selected_file_list = cell(0, 1);
    unselected_file_list = cell(0, 1);
    % ファイルごとに閾値を超えていなければ返り値に入れていく
    for i = 1:file_length
        data = mbf_loadData(file_list{i, 1}, move_range); % データの読み込み
        times = (0:0.001:0.001 * length(data.units));
        for ch = 1:data.channel_length
            values = mbf_getPowerSpectrum(times, data.values(:, ch), 1000);
            flag = true; % 閾値を超えたものがないかどうかを示す変数
            for t = 1:length(values.frequency)
                if values.frequency(t) >= frequency_range(1) && values.frequency(t) <= frequency_range(2) && values.power(t) > threshold
                    disp(strcat(num2str(values.frequency(t)), 'Hz/', num2str(values.power(t)), '>', num2str(threshold)));
                    flag = false;
                    break
                end
            end
            % 既に値が閾値を超えていれば切り上げる
            if ~flag
                disp(file_list{i, 1});
                break;
            end
        end
        if flag
            selected_file_list{height(selected_file_list) + 1, 1} = file_list{i, 1};
        else
            unselected_file_list{height(unselected_file_list) + 1, 1} = file_list{i, 1};
        end
    end
    file_lists.selected = selected_file_list;
    file_lists.unselected = unselected_file_list;
end