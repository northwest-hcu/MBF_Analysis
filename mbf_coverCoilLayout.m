function mbf_coverCoilLayout(fig, x, y, txt)
    figure(fig);
    hold on;
    rectangle('Position', [(-0.02 + x) (-0.02 + y) 0.04 0.04], 'Curvature', [1 1], 'LineStyle', '-', 'LineWidth', 1, 'FaceColor', 'w', 'EdgeColor', 'r');
    t = text(x, y, txt);
    t.HorizontalAlignment = 'center';
    t.VerticalAlignment = 'middle';
    t.FontSize = 6;
    % text(-0.03 + x, y, txt);
end