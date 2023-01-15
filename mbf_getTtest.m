function props = mbf_getTtest(file_list1, file_list2, move_range, same_point)
    disp(strcat('標本数 (1)', num2str(length(file_list1)), ' (2)', num2str(length(file_list2))));
    file_lists = cell(2, 1);
    file_lists{1, 1} = file_list1;
    file_lists{2, 1} = file_list2;
    store_values = cell(2, 1);
    for i = 1:2
        for f = 1:height(file_lists{i, 1})
            data = mbf_loadData(file_lists{i, 1}{f, 1}, move_range);
            if i==1
                channel_length = data.channel_length;
                sample_length = length(data.units);
                store_values{i, 1} = zeros(sample_length, channel_length, height(file_lists{i, 1}));
            end
            store_values{i, 1}(:, :, f) = data.values;
        end
    end
    test_flags = zeros(channel_length, 1);
    test_results = zeros(channel_length, 1);
    test_position = zeros(channel_length, 2);
    ave1 = mbf_calcAverage(file_list1, 20);
    ave2 = mbf_calcAverage(file_list2, 20);
    for ch = 1:channel_length
        % 200ms ~ 1200msの区間に限定して見る(データは-100ms ~ 1600ms, 1kHz)
        [max_1_value, max_1_index] = max(ave1.average(300:1300, ch));
        [min_1_value, min_1_index] = min(ave1.average(300:1300, ch));
        [max_2_value, max_2_index] = max(ave2.average(300:1300, ch));
        [min_2_value, min_2_index] = min(ave2.average(300:1300, ch));
        if ~same_point
            if max(abs(max_1_value), abs(max_2_value)) < max(abs(min_1_value), abs(min_2_value))
                t1 = min_1_index + 300;
                t2 = min_2_index + 300;
            else
                t1 = max_1_index + 300;
                t2 = max_2_index + 300;
            end
        % 同地点比較の場合
        else
            if abs(min_1_value) > abs(max_1_value)
                t1 = min_1_index + 300;
                t2 = min_1_index + 300;
            else
                t1 = max_1_index + 300;
                t2 = max_1_index + 300;
            end
        end
        % 該当時間を保存
        test_position(ch, 1) = data.units(t1);
        test_position(ch, 2) = data.units(t2);
        [test_flags(ch, 1), test_results(ch, 1)] = ttest2(store_values{1, 1}(t1, ch, :), store_values{2, 1}(t2, ch, :));
    end
    props.flags = test_flags; % 有意差があれば1, なければ0
    props.p_values = test_results;
    props.units = data.units;
    props.channel_length = channel_length;
    props.position = test_position;
end