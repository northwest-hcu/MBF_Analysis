plot_range.x_start = -100;
plot_range.x_end = 1000;
plot_range.y_start = -0.005;
plot_range.y_end = 0.005;
fig = figure();
fig1 = mbf_viewPlot(fig, {}, './test.txt', 0, 'test viewPlot window', plot_range);
fig2 = mbf_viewPlot(fig1.fig, fig1.labels, './test2.txt', 0, 'test2 viewPlot window', plot_range);