function props = mbf_getTtest(file_list1, file_list2)
    test_length = min(height(file_list1), height(file_list2));
    for i = 1:test_length
        data1 = mbf_loadData(file_list1{i, 1}, move_range);
        data2 = mbf_loadData(file_list2{i, 1}, move_range);
        if i==1
            channel_length = data1.channel_length;
            store_values1 = zeros(length(data1.units), channel_length, test_length);
            store_values2 = zeros(length(data1.units), channel_length, test_length);
        end
        values1 = data1.values;
        values2 = data2.values;
        for ch = 1:channel_length
            store_values1(:, ch, i) = values1;
            store_values2(:, ch, i) = values2;
        end  
    end
    test_results = cell(channel_length, 2);
    for ch = 1:channel_length
        [test_results{ch, 1}, test_results{ch, 2}] = ttest2(store_values1(:, ch, :), store_values2(:, ch, :));
    end
    props.flags = test_results{:, 1}; % 有意差があれば1, なければ0
    props.p_value = test_results{:, 2};
end