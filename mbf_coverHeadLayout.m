function points = mbf_coverHeadLayout(fig, points)
    % figureオブジェクトをマウント
    figure(fig);
    hold on;
    % 顔の輪郭データを読み込み
    layoutline1 = table2array(readtable('./headlayout1.csv'));
    layoutline2 = table2array(readtable('./headlayout2.csv'));
    layoutline3 = table2array(readtable('./headlayout3.csv'));
    layoutline4 = table2array(readtable('./headlayout4.csv'));
    % 顔の輪郭をグラフに追加
    plot(layoutline1(:,1), layoutline1(:,2), 'k', 'LineWidth',3);
    %plot(layoutline1(:,1), layoutline1(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline2(:,1), layoutline2(:,2), 'k', 'LineWidth',3);
    %plot(layoutline2(:,1), layoutline2(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline3(:,1), layoutline3(:,2), 'k', 'LineWidth',3);
    %plot(layoutline3(:,1), layoutline3(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
    plot(layoutline4(:,1), layoutline4(:,2), 'k', 'LineWidth',3);
    %plot(layoutline4(:,1), layoutline4(:,2), 'g', 'LineWidth',1, 'color', [222,184,135]./255);
%     img = imread('./brain.png');
%     img = flip(img);
%     [h, w, ~] = size(img);
%     img_alpha = ones(h, w, 3);
%     for i=1:h
%         for j=1:w
%             if img(i, j, :) <= [230 230 230] % RGB value
%                 img_alpha(i, j, :) = [0.4 0.4 0.4]; % transparent rate
%             end
%         end
%     end
% 
%     image([-0.35 0.35]*(w/h), [-0.35, 0.35], img_alpha);
    points = mbf_coverBrainLayout(fig, points);
    xlim([-0.6 0.6]);
    ylim([-0.6 0.6]);
    pbaspect([1 1 1]);
end