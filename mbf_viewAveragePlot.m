function props = mbf_viewAveragePlot(file_list, move_range, window_name, plot_range)
    position_map = mbf_getPosition(true);
    data = mbf_calcAverage(file_list, move_range);
    fig = figure('Name', strcat(window_name, '(平均・標準偏差)'), 'NumberTitle', 'off');
    plot_size = 0.04;  % 各グラフの大きさ(大きすぎると他のグラフと重なり、消してしまう)
    spread_rate = 1.7; % グラフ配置の拡散率
    for ch = 1:data.channel_length
        % 座標をposition_map.csvからもってきたデータをもとに指定
        pos = [position_map(ch, 2) * spread_rate + 0.5 - (plot_size / 2), position_map(ch, 3) * spread_rate + 0.5 - (plot_size / 2), plot_size, plot_size];
        subplot('Position', pos);
        e = errorbar(data.units, data.average(:, ch), data.std(:, ch));
        e.Color = [0.75 0.75 0.75];
        e.CapSize = 0;
        hold on;
        plot(data.units, data.average(:, ch), 'r');
        title(strcat(num2str(ch), ' ch'));
        xlim([plot_range.x_start plot_range.x_end]);
        ylim([plot_range.y_start plot_range.y_end]);
    end
    props.fig = fig;
    props.data = data;
end