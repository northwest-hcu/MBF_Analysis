function mbf_viewPositionMap(custom)
    fig = figure();
    position_map = mbf_getPosition(custom);
    plot(position_map(:, 2), position_map(:, 3), 'ro');
    for i=1:height(position_map)
        text(position_map(i, 2), position_map(i, 3), string(position_map(i, 1)));
    end
    mbf_coverHeadLayout(fig);
end