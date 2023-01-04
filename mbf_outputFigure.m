function mbf_outputFigure(dir_path, file_name, fig, file_type)
    addpath(dir_path);
    saveas(fig, strcat(dir_path, '/', file_name), file_type);
end