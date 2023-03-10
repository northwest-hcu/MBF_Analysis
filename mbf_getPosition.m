function position_map = mbf_getPosition(custom)
    csv_matrix = table2array(readtable('./position_map.csv'));
    channel_height = height(csv_matrix); % 読み込んだデータ行数
    channels = zeros(channel_height, 3); % チャンネル座標 ラベル, x軸座標, y軸座標
    if custom
        label_index = 4;
    else
        label_index = 1;
    end
    for i=1:channel_height
        for j=1:channel_height
            if isnan(csv_matrix(j, label_index)) || csv_matrix(j, label_index) == 0
                continue;
            end
            if i == csv_matrix(j, label_index)
                channels(i, 1) = csv_matrix(j, label_index);
                channels(i, 2:3) = csv_matrix(j, 2:3);
                break;
            end
        end
    end
    end_matrix = find(channels(:,1) == 0);
    if isempty(end_matrix)
        position_map = channels(1:height(csv_matrix), 1:3);
    else
        position_map = channels(1:end_matrix - 1, 1:3);
    end
end