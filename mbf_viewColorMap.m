function props = mbf_viewColorMap(file_list, move_range, window_name, plot_range, mesh_density)
    position_map = mbf_getPosition(true);
    data = mbf_calcAverage(file_list, move_range);
    fig = figure('Name', strcat(window_name, '(カラーマップ)'), 'NumberTitle', 'off');
    % カラーマップ精度の指定
    if strcmp(mesh_density, 'high')
        [Xq, Yq]=meshgrid(-0.5:0.0002:0.5, -0.5:0.0002:0.5);
    elseif strcmp(mesh_density, 'normal')
        [Xq, Yq] = meshgrid(-0.5:0.0005:0.5, -0.5:0.0005:0.5);
    elseif strcmp(mesh_density, 'low')
        [Xq, Yq] = meshgrid(-0.5:0.001:0.5, -0.5:0.001:0.5);
    end
    % グラフ数の計算
    graph_count = (plot_range.x_end - plot_range.x_start) / plot_range.interval;
    if rem(plot_range.x_end - plot_range.x_start, plot_range.interval) > 0
        graph_count = graph_count + 1;
    end
    % プロット行数の計算
    line = fix(graph_count / 5);
    if rem(graph_count, 5) > 0
        line = line + 1;
    end
    points.flag = false;
    % 各グラフの表示
    for i = 1:graph_count
        colormap('jet');
        % 対応する時刻とデータのインデックスを計算
        if i == 1
            t = plot_range.x_start;
            index = plot_range.x_start - data.units(1) + 1;
        else
            t = t + plot_range.interval;
            index = index + plot_range.interval;
        end
        % 横に5つを最大として並べる
        if graph_count < 5
            subplot(1, graph_count, i);
        else
            subplot(line, 5, i);
        end
        % カラーマップの計算・描画
        points = mbf_coverHeadLayout(fig, points);
        Vq = griddata(position_map(:, 2), position_map(:, 3), data.average(index, :), Xq, Yq);
        % 等高線行列とcontourオブジェクトを得る(前者は使わないため破棄)
        [~, c] = contourf(Xq, Yq, Vq);
        set(c, 'edgecolor', 'none');
        set(c, 'LineColor', 'none');
        set(c, 'FaceAlpha', 0.8);
        clim([plot_range.y_start plot_range.y_end]);
        title(strcat(num2str(t), 'ms'));
        % 横軸・縦軸の非表示
        ax = gca;
        ax.XTickLabel = cell(size(ax.XTickLabel));
        ax.YTickLabel = cell(size(ax.YTickLabel));
        pbaspect([1 1 1]);
        clear Vq;
        clear c;
    end
    c = colorbar('southoutside');
    c.Position(1:4) = [0.1, 0.06, 0.8, 0.01];
    props.fig = fig;
end