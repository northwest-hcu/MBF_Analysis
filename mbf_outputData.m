function outputData(dir_path, file_name, units, values)
    addpath(dir_path);
    writematrix(horzcat(units, values), strcat(dir_path, '/', file_name));
end