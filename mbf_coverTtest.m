function fig = mbf_coverTtest(fig, props)
    position_map = mbf_getPosition(true);
    figure(fig);
    plot_size = 0.04;  % 各グラフの大きさ(大きすぎると他のグラフと重なり、消してしまう)
    spread_rate = 1.7; % グラフ配置の拡散率
    flags = props.flags;
    for ch = 1:props.channel_length
        % 座標をposition_map.csvからもってきたデータをもとに指定
        pos = [position_map(ch, 2) * spread_rate + 0.5 - (plot_size / 2), position_map(ch, 3) * spread_rate + 0.5 - (plot_size / 2), plot_size, plot_size];
        subplot('Position', pos);
        hold on;
        if flags(ch, 1)
            xline([props.position(ch, 1) props.position(ch, 2)], '-r');
        else
            xline([props.position(ch, 1) props.position(ch, 2)], '-b');
        end
    end
end