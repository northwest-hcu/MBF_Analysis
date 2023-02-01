function mbf_viewPositionMap(custom)
    fig = figure();
    points.flag = false;
    mbf_coverHeadLayout(fig, points);
    position_map = mbf_getPosition(custom);
    plot(position_map(:, 2), position_map(:, 3), 'ro');
    for i=1:height(position_map)
        mbf_coverCoilLayout(fig, position_map(i, 2), position_map(i, 3), string(position_map(i, 1)));
    end
    ax = gca;
    ax.XTickLabel = cell(size(ax.XTickLabel));
    ax.YTickLabel = cell(size(ax.YTickLabel));
end