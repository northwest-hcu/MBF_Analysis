function mbf_subCoverHeadLayout(fig)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    % 顔の輪郭データを読み込み
    layoutline1 = table2array(readtable('./sub_headlayout1.csv'));
    layoutline2 = table2array(readtable('./sub_headlayout2.csv'));
    layoutline3 = table2array(readtable('./sub_headlayout3.csv'));
    layoutline4 = table2array(readtable('./sub_headlayout4.csv'));
    layoutline5 = table2array(readtable('./sub_headlayout5.csv'));
    % 顔の輪郭をグラフに追加
    plot(layoutline1(:,1), layoutline1(:,2), 'k', 'LineWidth',3);
    %plot(layoutline1(:,1), layoutline1(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline2(:,1), layoutline2(:,2), 'k', 'LineWidth',3);
    %plot(layoutline2(:,1), layoutline2(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline3(:,1), layoutline3(:,2), 'k', 'LineWidth',3);
    %plot(layoutline3(:,1), layoutline3(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline4(:,1), layoutline4(:,2), 'k', 'LineWidth',3);
    %plot(layoutline4(:,1), layoutline4(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline5(:,1), layoutline5(:,2), 'k', 'LineWidth',3);
    xlim([-1 1]);
    ylim([-1 1]);
end