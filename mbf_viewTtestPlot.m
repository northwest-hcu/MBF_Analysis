function props = mbf_viewTtestPlot(file_list1, file_list2, window_name)
    data = mbf_getTtest(file_list1, file_list2, 20);
    position_map = mbf_getPosition(true);
    fig = figure();
    set(fig, 'Name', strcat(window_name, '(t検定)'));
    set(fig, 'NumberTitle', 'off');
    plot_size = 0.04;  % 各グラフの大きさ(大きすぎると他のグラフと重なり、消してしまう)
    spread_rate = 1.7; % グラフ配置の拡散率
    plot_range.x_start = data.units(1);
    plot_range.x_end = data.units(height(data.units));
    plot_range.y_start = 0;
    plot_range.y_end = 1;
    for ch = 1:data.channel_length
        % 座標をposition_map.csvからもってきたデータをもとに指定
        pos = [position_map(ch, 2) * spread_rate + 0.5 - (plot_size / 2), position_map(ch, 3) * spread_rate + 0.5 - (plot_size / 2), plot_size, plot_size];
        subplot('Position', pos);
        plot(data.units, data.flags(:, ch));
        hold on;
        title(strcat(num2str(ch), ' ch'));
        xlim([plot_range.x_start plot_range.x_end]);
        ylim([plot_range.y_start plot_range.y_end]);
    end
    props.fig = fig;
    props.p_values = data.p_values;
    props.flags = data.flags;
    props.units = data.units;
    props.channel_length = data.channel_length;
end