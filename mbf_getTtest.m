function props = mbf_getTtest(file_list1, file_list2, move_range)
    disp(strcat('標本数 (1)', num2str(length(file_list1)), ' (2)', num2str(length(file_list2))));
    file_lists = cell(2, 1);
    file_lists{1, 1} = file_list1;
    file_lists{2, 1} = file_list2;
    store_values = cell(2, 1);
    for i = 1:2
        for f = 1:height(file_lists{i, 1})
            disp(file_lists{i, 1});
            data = mbf_loadData(file_lists{i, 1}{f, 1}, move_range);
            if i==1 && f == 1
                channel_length = data.channel_length;
                sample_length = length(data.units);    
                test_values = zeros(sample_length, channel_length, 2);
            end
            if f==1
                store_values{i, 1} = zeros(sample_length, channel_length, height(file_lists{i, 1}));
            end
            store_values{i, 1}(:, :, f) = data.values;
        end
    end
    for ch = 1:channel_length
        for t = 1:sample_length
            [test_values(t, ch, 1), test_values(t, ch, 2)] = ttest2(store_values{1, 1}(t, ch, :), store_values{2, 1}(t, ch, :), 'Alpha', 0.01);
        end
    end
    props.flags = test_values(:, :, 1); % 有意差があれば1, なければ0
    props.p_values = test_values(:, :, 2);
    props.units = data.units;
    props.channel_length = channel_length;
end