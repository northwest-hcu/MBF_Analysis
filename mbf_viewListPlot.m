function mbf_viewListPlot(file_list, move_range, window_name, plot_range)
    if ~isempty(file_list)
        fig = figure();
    end
    for i=1:length(file_list)
        if i == 1
            fig = mbf_viewPlot(fig, {}, file_list{i, 1}, move_range, window_name, plot_range); 
        else
            fig = mbf_viewPlot(fig.fig, fig.labels, file_list{i, 1}, move_range, window_name, plot_range);
        end
    end
end