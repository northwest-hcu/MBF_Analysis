function points = mbf_coverBrainLayout(fig, points)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    img = imread('./brain.jpg');
    img = flip(img);
    [h, w, ~] = size(img);
    y_start = -0.38;
    y_end = 0.4;
    x_start = -0.3;
    x_end = 0.3;
    image(img, 'XData', [x_start x_end], 'YData', [y_start y_end]);
%     x_start = -0.28;
%     x_end = 0.28;
    
%     if points.flag
%         plot(points.data(:, 1), points.data(:, 2), '.', 'MarkerSize', 1, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', [0.5 0.5 0.5]);
%     else
%         points.data = zeros(0, 2);
%         points.flag = true;
%         for i=1:h
%             for j=1:w
%                 if img(i, j, :) <= [200 200 200] % RGB value
%                     y = (((y_end - y_start) / h) * i + y_start);% * (2 / pi);
%                     x = (((x_end - x_start) / w) * j + x_start);% * (2 / pi);
%                     data = zeros(1, 2);
%                     data(1, 1) = x;
%                     data(1, 2) = y;
%                     points.data = vertcat(points.data, data);
%                     plot(x, y, '.', 'MarkerSize', 1, 'MarkerFaceColor', 'none', 'MarkerEdgeColor', [0.5 0.5 0.5]);
%                 end
%             end
%         end
%     end

    pbaspect([1 1 1]);
end