function mbf_coverExpandSystem10_20()
    fig = figure();
    hold on;
    points.flag = false;
    layout_bone = table2array(readtable('./layout_outline2.csv')) * 0.9; % 頭蓋骨
    plot(layout_bone(:, 1), layout_bone(:, 2), 'r:', 'LineWidth', 1);
%     layout_bone = layout_bone * 0.9; % 頭蓋骨の内側で計算
    front_bone = max(layout_bone(:, 2));
    back_bone = min(layout_bone(:, 2));
    left_bone = min(layout_bone(:, 1));
    right_bone = max(layout_bone(:, 1));

    mbf_coverHeadLayout(fig, points);
    plot(layout_bone(:, 1) * sin((pi / 2) * (1 / 4)), layout_bone(:, 2) * sin((pi / 2) * (1 / 4)), 'k:', 'LineWidth', 1);
    plot(layout_bone(:, 1) * sin((pi / 2) * (2 / 4)), layout_bone(:, 2) * sin((pi / 2) * (2 / 4)), 'k:', 'LineWidth', 1);
    plot(layout_bone(:, 1) * sin((pi / 2) * (3 / 4)), layout_bone(:, 2) * sin((pi / 2) * (3 / 4)), 'k:', 'LineWidth', 1);

    for i = 0:19
        plot([0 cos(pi*(i/10))], [0 sin(pi*(i/10))], 'k:');
    end

    % ----- 正中線 -----

%     % Nz
%     mbf_coverCoilLayout(fig, 0, front_bone, 'Nz');

    % Fpz
    mbf_coverCoilLayout(fig, 0, front_bone, 'Fpz');

    % AFz
    mbf_coverCoilLayout(fig, 0, front_bone * sin((pi / 2) * (3 / 4)), 'AFz');
    
    % Fz
    mbf_coverCoilLayout(fig, 0, front_bone * sin((pi / 2) * (2 / 4)), 'Fz');

    % FCz
    mbf_coverCoilLayout(fig, 0, front_bone * sin((pi / 2) * (1 / 4)), 'FCz');

    % Cz
    mbf_coverCoilLayout(fig, 0, 0, 'Cz');

    % CPz
    mbf_coverCoilLayout(fig, 0, back_bone * sin((pi / 2) * (1 / 4)), 'CPz');

    % Pz
    mbf_coverCoilLayout(fig, 0, back_bone * sin((pi / 2) * (2 / 4)), 'Pz');

    % POz
    mbf_coverCoilLayout(fig, 0, back_bone * sin((pi / 2) * (3 / 4)), 'POz');

    % Oz
    mbf_coverCoilLayout(fig, 0, back_bone, 'Oz');

%     % Iz
%     mbf_coverCoilLayout(fig, 0, back_bone, 'Iz');

    % ----- 左耳～右耳 -----

%     % T9
%     mbf_coverCoilLayout(fig, left_bone, 0, 'T9');

    % T7
    mbf_coverCoilLayout(fig, left_bone, 0, 'T7');

    % C5
    mbf_coverCoilLayout(fig, left_bone * sin((pi / 2) * (3 / 4)), 0, 'C5');

    % C3
    mbf_coverCoilLayout(fig, left_bone * sin((pi / 2) * (2 / 4)), 0, 'C3');

    % C1
    mbf_coverCoilLayout(fig, left_bone * sin((pi / 2) * (1 / 4)), 0, 'C1');

    % C2
    mbf_coverCoilLayout(fig, right_bone * sin((pi / 2) * (1 / 4)), 0, 'C2');

    % C4
    mbf_coverCoilLayout(fig, right_bone * sin((pi / 2) * (2 / 4)), 0, 'C4');

    % C6
    mbf_coverCoilLayout(fig, right_bone * sin((pi / 2) * (3 / 4)), 0, 'C6');

    % T8
    mbf_coverCoilLayout(fig, right_bone, 0, 'T8');

%     % T10
%     mbf_coverCoilLayout(fig, right_bone, 0, 'T10');

    % ----- 外周 -----
    
    % 10%
    rad_10.x = 0.294828 * 0.9;
    rad_10.y = 0.0957953 * 0.9;

    % 20%
    rad_20.x = 0.258885 * 0.9;
    rad_20.y = 0.188091 * 0.9;

    % 30%
    rad_30.x = 0.205725 * 0.9;
    rad_30.y = 0.283156 * 0.9;

    % 40%
    rad_40.x = 0.120517 * 0.9;
    rad_40.y = 0.370912 * 0.9;

    % -10%
    rad__10.x = 0.313849 * 0.9;
    rad__10.y = -0.101976 * 0.9;

    % -20%
    rad__20.x = 0.283156 * 0.9;
    rad__20.y = -0.205725 * 0.9;

    % -30%
    rad__30.x = 0.211603 * 0.9;
    rad__30.y = -0.291246 * 0.9;

    % -40%
    rad__40.x = 0.114336 * 0.9;
    rad__40.y = -0.351891 * 0.9;

    % FC8
    mbf_coverCoilLayout(fig, rad_10.x, rad_10.y, 'FC8');

    % F8
    mbf_coverCoilLayout(fig, rad_20.x, rad_20.y, 'F8');

    % AF8
    mbf_coverCoilLayout(fig, rad_30.x, rad_30.y, 'AF8');

    % Fp2
    mbf_coverCoilLayout(fig, rad_40.x, rad_40.y, 'Fp2');

    % Fp1
    mbf_coverCoilLayout(fig, -1 * rad_40.x, rad_40.y, 'Fp1');

    % AF7
    mbf_coverCoilLayout(fig, -1 * rad_30.x, rad_30.y, 'AF7');

    % F7
    mbf_coverCoilLayout(fig, -1 * rad_20.x, rad_20.y, 'F7');

    % FC7
    mbf_coverCoilLayout(fig, -1 * rad_10.x, rad_10.y, 'FC7');

    % TP7
    mbf_coverCoilLayout(fig, -1 * rad__10.x, rad__10.y, 'TP7');

    % P7
    mbf_coverCoilLayout(fig, -1 * rad__20.x, rad__20.y, 'P7');

    % PO7
    mbf_coverCoilLayout(fig, -1 * rad__30.x, rad__30.y, 'PO7');

    % O1
    mbf_coverCoilLayout(fig, -1 * rad__40.x, rad__40.y, 'O1');

    % O2
    mbf_coverCoilLayout(fig, rad__40.x, rad__40.y, 'O2');

    % PO8
    mbf_coverCoilLayout(fig, rad__30.x, rad__30.y, 'PO8');

    % P8
    mbf_coverCoilLayout(fig, rad__20.x, rad__20.y, 'P8');

    % TP8
    mbf_coverCoilLayout(fig, rad__10.x, rad__10.y, 'TP8');

    % ----- 中間点 -----

    % F3(Fp1とC3の中点でF7とFzの中点)
    point = mbf_getCrossPoint(-1 * rad_40.x, rad_40.y, left_bone * 0.4, 0, -1 * rad_20.x, rad_20.y, 0, front_bone * 0.4);
    mbf_coverCoilLayout(fig, point.x, point.y, 'F3');

    % P3(O1とC3の中点でP7とPzの中点)
    point = mbf_getCrossPoint(-1 * rad__40.x, rad__40.y, left_bone * 0.4, 0, -1 * rad__20.x, rad__20.y, 0, back_bone * 0.4);
    mbf_coverCoilLayout(fig, point.x, point.y, 'P3');

    % F4(Fp2とC4の中点でF8とFzの中点)
    point = mbf_getCrossPoint(rad_40.x, rad_40.y, right_bone * 0.4, 0, rad_20.x, rad_20.y, 0, front_bone * 0.4);
    mbf_coverCoilLayout(fig, point.x, point.y, 'F4');

    % P4(O2とC4の中点でP8とPzの中点)
    point = mbf_getCrossPoint(rad__40.x, rad__40.y, right_bone * 0.4, 0, rad__20.x, rad__20.y, 0, back_bone * 0.4);
    mbf_coverCoilLayout(fig, point.x, point.y, 'P3');

end