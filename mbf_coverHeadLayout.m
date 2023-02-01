function points = mbf_coverHeadLayout(fig)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    % 顔の輪郭データを読み込み
%     layoutline1 = table2array(readtable('./layout_outline1.csv')); % MRI
%     layoutline2 = table2array(readtable('./layout_outline2.csv')); % 頭蓋骨
%     layoutline3 = table2array(readtable('./layout_outline3.csv')); % 鼻
%     layoutline4 = table2array(readtable('./layout_outline4.csv')); % 左耳
%     layoutline5 = table2array(readtable('./layout_outline5.csv')); % 右耳
    % 顔の輪郭をグラフに追加
%     plot(layoutline1(:, 1), layoutline1(:, 2), 'k', 'LineWidth',2);
%     plot(layoutline2(:, 1), layoutline2(:, 2), 'k', 'LineWidth',2);
%     plot(layoutline3(:, 1), layoutline3(:, 2), 'k', 'LineWidth',2);
%     plot(layoutline4(:, 1), layoutline4(:, 2), 'k', 'LineWidth',2);
%     plot(layoutline5(:, 1), layoutline5(:, 2), 'k', 'LineWidth',2);
    
    mbf_coverBrainLayout(fig);
    xlim([-0.6 0.6]);
    ylim([-0.6 0.6]);
    % pbaspect([1 1 1]);
end