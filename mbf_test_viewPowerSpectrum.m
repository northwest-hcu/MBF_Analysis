plot_range.x_start = 0;
plot_range.x_end = 500;
plot_range.y_start = 0;
plot_range.y_end = 1;
file_list = cell(3, 1);
file_list{1, 1} = 'test.txt';
file_list{2, 1} = 'test2.txt';
file_list{3, 1} = 'test3.txt';
mbf_viewPowerSpectrum(file_list, 0, 'test viewPowerSpectrum window', plot_range);