function results = mbf_calcAverage(file_list, move_range)
    file_length = length(file_list);
    for i=1:file_length
        data = mbf_loadData(file_list{i, 1}, move_range); % データの読み込み
        if i == 1
            channel_length = data.channel_length;   % チャンネル数
            units = data.units;                     % 時間
            sample_length = length(units);          % データ数
            sum_values = zeros(sample_length, channel_length); % 時間ごとの総加算値
            store_std_data = zeros(sample_length, channel_length, file_length);
        end
        values = data.values;                   % 電圧値
        sum_values = sum_values + values;
        store_std_data(:, :, i) = values;
    end
    % 平均値と標準偏差の配列を事前定義
    average_data = zeros(sample_length, channel_length);
    std_data = zeros(sample_length, channel_length);
    % 各チャネルごとに平均値と標準偏差
    for ch=1:channel_length
        average_data = sum_values / file_length;
        for t=1:sample_length
            std_data(t, ch) = transpose(std(store_std_data(t, ch, :)));
        end
    end
    results.units = units;
    results.channel_length = channel_length;
    results.average = average_data;
    results.std = std_data;
end

