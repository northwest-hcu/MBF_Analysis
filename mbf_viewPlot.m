function props = mbf_viewPlot(fig, labels, file_path, move_range, window_name, plot_range)
    position_map = mbf_getPosition(true);
    data = mbf_loadData(file_path, move_range);
    values = data.values;
    units = data.units;
    figure(fig);
    labels{height(labels) + 1, 1} = data.file_name;
    set(fig, 'Name', strcat(window_name, '(各波形)'));
    set(fig, 'NumberTitle', 'off');
    plot_size = 0.04;  % 各グラフの大きさ(大きすぎると他のグラフと重なり、消してしまう)
    spread_rate = 1.7; % グラフ配置の拡散率
    for ch = 1:data.channel_length
        % 座標をposition_map.csvからもってきたデータをもとに指定
        pos = [position_map(ch, 2) * spread_rate + 0.5 - (plot_size / 2), position_map(ch, 3) * spread_rate + 0.5 - (plot_size / 2), plot_size, plot_size];
        subplot('Position', pos);
        plot(units, values(:, ch),'LineWidth',1);
        hold on;
        title(strcat(num2str(ch), ' ch'));
        xlim([plot_range.x_start plot_range.x_end]);
        ylim([plot_range.y_start plot_range.y_end]);
    end
    legend(labels);
    props.fig = fig;
    props.labels = labels;
    props.data = data;
end