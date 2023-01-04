plot_range.x_start = -100;
plot_range.x_end = 1000;
plot_range.y_start = -0.005;
plot_range.y_end = 0.005;
file_list = cell(3, 1);
file_list{1, 1} = 'test.txt';
file_list{2, 1} = 'test2.txt';
file_list{3, 1} = 'test3.txt';
% val = mbf_calcAverage(file_list, 0);
props = mbf_viewAveragePlot(file_list, 0, 'test viewPlot window', plot_range);
% testフォルダの作成
if exist('test') ~= 7
    mkdir('test');
end
% 平均値データとグラフの保存
mbf_outputData('test', 'average.txt', props.data.units, props.data.average);
mbf_outputFigure('test', 'average.fig', props.fig, 'fig');
