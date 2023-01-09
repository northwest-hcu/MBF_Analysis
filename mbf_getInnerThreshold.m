% 指定された時間が閾値の範囲での変動であるものだけ抽出
function file_lists = mbf_getInnerThreshold(file_list, threshold, time_range, move_range)
    file_length = length(file_list);
    selected_file_list = cell(0, 1);
    unselected_file_list = cell(0, 1);
    % ファイルごとに閾値を超えていなければ返り値に入れていく
    for i=1:file_length
        data = mbf_loadData(file_list{i, 1}, move_range); % データの読み込み
        flag = true;
        for t = 1:length(data.units)
            if data.units(t) < time_range(1) || data.units(t) > time_range(2)
                continue;
            end
            max_value = max(data.values(t, :));
            min_value = min(data.values(t, :));
            if max_value - min_value > threshold % + center
                disp(strcat(file_list{i, 1}, ' is over threshold.(', num2str(data.units(t)), 'ms)(max - min = ', num2str(max_value - min_value),')'));
                flag = false;
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