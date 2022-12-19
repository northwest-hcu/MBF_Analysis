function arr=getPosition(dir_name,custom)
    file_name=strcat(dir_name,'/position_matrix.csv');
    addpath(dir_name);
    channels=table2array(readtable(file_name));
    if custom
        arr=[];
        for i=1:height(channels)
            for j=1:height(channels)
                if ~isnan(channels(j,4)) && channels(j,4)==i
                    arr=vertcat(arr,channels(j,1:4));
                end
            end
        end
    else
        arr=channels(:,1:3);
    end
end