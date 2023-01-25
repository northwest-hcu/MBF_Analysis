function mbf_coverExpandSystem10_20()
    fig = figure();
    hold on;
    points.flag = false;
    mbf_coverHeadLayout(fig, points);
    rectangle('Position', [-0.1 -0.1 0.2 0.2], 'Curvature', [1 1], 'LineStyle', ':', 'LineWidth', 2);
    rectangle('Position', [-0.2 -0.2 0.4 0.4], 'Curvature', [1 1], 'LineStyle', ':', 'LineWidth', 2);
    rectangle('Position', [-0.3 -0.3 0.6 0.6], 'Curvature', [1 1], 'LineStyle', ':', 'LineWidth', 2);
    rectangle('Position', [-0.4 -0.4 0.8 0.8], 'Curvature', [1 1], 'LineStyle', ':', 'LineWidth', 2);
    for i = 0:19
        plot([0 0.5*cos(pi*(i/10))], [0 0.5*sin(pi*(i/10))], 'k--');
    end

    % ----- 正中線 -----

    % Nz
    mbf_coverCoilLayout(fig, 0, 0.5, 'Nz');

    % Fpz
    mbf_coverCoilLayout(fig, 0, 0.4, 'Fpz');

    % AFz
    mbf_coverCoilLayout(fig, 0, 0.3, 'AFz');
    
    % Fz
    mbf_coverCoilLayout(fig, 0, 0.2, 'Fz');

    % FCz
    mbf_coverCoilLayout(fig, 0, 0.1, 'FCz');

    % Cz
    mbf_coverCoilLayout(fig, 0, 0, 'Cz');

    % CPz
    mbf_coverCoilLayout(fig, 0, -0.1, 'CPz');

    % Pz
    mbf_coverCoilLayout(fig, 0, -0.2, 'Pz');

    % POz
    mbf_coverCoilLayout(fig, 0, -0.3, 'POz');

    % Oz
    mbf_coverCoilLayout(fig, 0, -0.4, 'Oz');

    % Iz
    mbf_coverCoilLayout(fig, 0, -0.5, 'Iz');

    % ----- 左耳～右耳 -----

    % T9
    mbf_coverCoilLayout(fig, -0.5, 0, 'T9');

    % T7
    mbf_coverCoilLayout(fig, -0.4, 0, 'T7');

    % C5
    mbf_coverCoilLayout(fig, -0.3, 0, 'C5');

    % C3
    mbf_coverCoilLayout(fig, -0.2, 0, 'C3');

    % C1
    mbf_coverCoilLayout(fig, -0.1, 0, 'C1');

    % C2
    mbf_coverCoilLayout(fig, 0.1, 0, 'C2');

    % C4
    mbf_coverCoilLayout(fig, 0.2, 0, 'C4');

    % C6
    mbf_coverCoilLayout(fig, 0.3, 0, 'C6');

    % T8
    mbf_coverCoilLayout(fig, 0.4, 0, 'T8');

    % T10
    mbf_coverCoilLayout(fig, 0.5, 0, 'T10');

    % T10
    mbf_coverCoilLayout(fig, 0.5, 0, 'T10');

    % ----- 外周 -----
    
    % FC8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(1/10)), 0.4*sin(pi*(1/10)), 'FC8');

    % F8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(2/10)), 0.4*sin(pi*(2/10)), 'F8');

    % AF8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(3/10)), 0.4*sin(pi*(3/10)), 'AF8');

    % Fp2
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(4/10)), 0.4*sin(pi*(4/10)), 'Fp2');

    % Fp1
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(6/10)), 0.4*sin(pi*(6/10)), 'Fp1');

    % AF7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(7/10)), 0.4*sin(pi*(7/10)), 'AF7');

    % F7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(8/10)), 0.4*sin(pi*(8/10)), 'F7');

    % FC7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(9/10)), 0.4*sin(pi*(9/10)), 'FC7');

    % TP7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(11/10)), 0.4*sin(pi*(11/10)), 'TP7');

    % P7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(12/10)), 0.4*sin(pi*(12/10)), 'P7');

    % PO7
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(13/10)), 0.4*sin(pi*(13/10)), 'PO7');

    % O1
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(14/10)), 0.4*sin(pi*(14/10)), 'O1');

    % O2
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(16/10)), 0.4*sin(pi*(16/10)), 'O2');

    % PO8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(17/10)), 0.4*sin(pi*(17/10)), 'PO8');

    % P8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(18/10)), 0.4*sin(pi*(18/10)), 'P8');

    % TP8
    mbf_coverCoilLayout(fig, 0.4*cos(pi*(19/10)), 0.4*sin(pi*(19/10)), 'TP8');

    % ----- 中間点 -----

    % F3(Fp1とC3の中点でF7とFzの中点)
    point = mbf_getCrossPoint(0.4*cos(pi*(6/10)), 0.4*sin(pi*(6/10)), -0.2, 0, 0.4*cos(pi*(8/10)), 0.4*sin(pi*(8/10)), 0, 0.2);
    mbf_coverCoilLayout(fig, point.x, point.y, 'F3');

    % P3(O1とC3の中点でP7とPzの中点)
    point = mbf_getCrossPoint(0.4*cos(pi*(14/10)), 0.4*sin(pi*(14/10)), -0.2, 0, 0.4*cos(pi*(12/10)), 0.4*sin(pi*(12/10)), 0, -0.2);
    mbf_coverCoilLayout(fig, point.x, point.y, 'P3');

    % F4(Fp2とC4の中点でF8とFzの中点)
    point = mbf_getCrossPoint(0.4*cos(pi*(4/10)), 0.4*sin(pi*(4/10)), 0.2, 0, 0.4*cos(pi*(2/10)), 0.4*sin(pi*(2/10)), 0, 0.2);
    mbf_coverCoilLayout(fig, point.x, point.y, 'F4');

    % P3(O2とC4の中点でP8とPzの中点)
    point = mbf_getCrossPoint(0.4*cos(pi*(16/10)), 0.4*sin(pi*(16/10)), 0.2, 0, 0.4*cos(pi*(18/10)), 0.4*sin(pi*(18/10)), 0, -0.2);
    mbf_coverCoilLayout(fig, point.x, point.y, 'P3');

end