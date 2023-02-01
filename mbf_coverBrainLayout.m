function mbf_coverBrainLayout(fig)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    img = imread('./brain.jpg');
    img = flip(img);
%     [h, w, ~] = size(img);
    y_start = -0.38;
    y_end = 0.4;
    x_start = -0.3;
    x_end = 0.3;
    image(img, 'XData', [x_start x_end], 'YData', [y_start y_end]);
    pbaspect([1 1 1]);
end