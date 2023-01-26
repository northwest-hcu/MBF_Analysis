function points = mbf_coverBrainLayout(fig, points)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    img = imread('./brain.png');
    img = flip(img);
    [h, w, ~] = size(img);
    y_start = -0.55;
    y_end = 0.55;
%     x_start = y_start * (w / h);
%     x_end = y_end * (w / h);
    x_start = -0.45;
    x_end = 0.45;
    
    if points.flag
        plot(points.data(:, 1), points.data(:, 2), '.', 'MarkerSize', 1, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', [0.5 0.5 0.5]);
    else
        points.data = zeros(0, 2);
        points.flag = true;
        for i=1:h
            for j=1:w
                if img(i, j, :) <= [200 200 200] % RGB value
                    y = (((y_end - y_start) / h) * i + y_start);% * (2 / pi);
                    x = (((x_end - x_start) / w) * j + x_start);% * (2 / pi);
                    data = zeros(1, 2);
                    data(1, 1) = x;
                    data(1, 2) = y;
                    points.data = vertcat(points.data, data);
                    plot(x, y, '.', 'MarkerSize', 1, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', [0.5 0.5 0.5]);
                end
            end
        end
    end
    pbaspect([w/max([w h]) h/max([w h]) 1]);
end