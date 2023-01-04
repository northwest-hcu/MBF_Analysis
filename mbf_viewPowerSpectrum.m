function props = mbf_viewPowerSpectrum(file_list, move_range, window_name, plot_range)
    position_map = mbf_getPosition(true);
    fig = figure('Name', strcat(window_name, '(スペクトル解析)'));
    labels = cell(height(file_list), 1);
    plot_size = 0.04;  % 各グラフの大きさ(大きすぎると他のグラフと重なり、消してしまう)
    spread_rate = 1.7; % グラフ配置の拡散率
    for i = 1:length(file_list)
        data = mbf_loadData(file_list{i, 1}, move_range);
        for ch = 1:data.channel_length
            % 座標をposition_map.csvからもってきたデータをもとに指定
            pos = [position_map(ch, 2) * spread_rate + 0.5 - (plot_size / 2), position_map(ch, 3) * spread_rate + 0.5 - (plot_size / 2), plot_size, plot_size];
            subplot('Position', pos);
            % 各チャネルの周波数解析結果を取得
            values = mbf_getPowerSpectrum(data.frequency, data.power);
            hold on;
            plot(values.frequency, values.power);
            title(strcat(num2str(ch), ' ch'));
            xlim([plot_range.x_start plot_range.x_end]);
            ylim([plot_range.y_start plot_range.y_end]);
        end
        labels{i, 1} = data.file_name;
    end
    legend(labels);
    props.fig = fig;
    props.labels = labels;
end