function props = mbf_loadData(file_path, move_range)
    file_props = dir(file_path);              % ファイルの各プロパティ
    if isempty(file_props)
        disp(strcat('File ', file_path, ' is not found.'));
        return;
    end
    file_data = importdata(file_path);             % ファイルの読み込み
    units = file_data(:, 1);                       % データの取得した時間範囲
    data = file_data(:, 2:width(file_data));       % データの取得した中身
    store_data = zeros(height(data), width(data)); % 移動平均後用の配列データ変数
    % 移動平均が0でなければ移動平均をかける
    if move_range > 0
        for ch=1:width(data)
            store_data(:, ch) = movmean(data(:, ch), move_range);
        end
    else
        store_data = data;
    end
    % 返り値のプロパティ
    props.file_name = file_props(1).name;
    props.file_dir = file_props(1).folder;
    props.units = units;
    props.values = store_data;
    props.channel_length = width(data);
end