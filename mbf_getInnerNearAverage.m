function file_lists = mbf_getInnerNearAverage(file_list, move_range, threshold)
    results = mbf_calcAverage(file_list, move_range);
    average = results.average;
    selected_file_list = cell(0, 1);
    unselected_file_list = cell(0, 1);
    for i = 1:length(file_list)
        data = mbf_loadData(file_list{i, 1}, move_range);
        flag = true;
        for t = 1:length(data.units)
            for ch = 1:data.channel_length
                if abs(data.values(t, ch) - average(t, ch)) > threshold
                    disp(strcat(file_list{i, 1}, ' is over range.(', num2str(data.units(t)), 'ms)(', num2str(ch), 'ch)'));
                    flag = false;
                    break;
                end
            end
            if ~flag
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