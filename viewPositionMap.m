% file_name:ファイル名
% explain_char:番号表示
% custom_label:trueで4カラム目のみ適用 falseで1カラム目を適用

% チャネルの位置を表示
function viewPositionMap(file_name,explain_char,custom_label)
    % ポジションマップ
    %file_name='end_matrix.csv'; %1:インデックス, 2:x座標, 3:y座標のcsvファイル, 4:扱う座標ラベル
    channels=table2array(readtable(file_name));
    
    if custom_label
        channels_store=[];
        for i=1:height(channels)
            if ~isnan(channels(i,4))
                channels_store=vertcat(channels_store,channels(i,2:4));
            end
        end
        channels_store=sortrows(channels_store,3);
        EEG=channels_store(:,1:2);
        channels_label=channels_store(:,3);
    else
        EEG=channels(:,2:3);
        channels_label=channels(:,1);
    end
    channels_height=height(EEG);

    figure;
    plot(EEG(:,1),EEG(:,2),'ro');
    axis([-0.7 0.7 -0.7 0.7]); %2次元表示 範囲指定
    % ラベルの出力
    %explain_char=true;
    if explain_char
        for n=1:channels_height
            text(EEG(n,1),EEG(n,2),string(channels_label(n,1)));
        end
    end
    
    for i=1:12
        set(rectangle('position',i*0.011*[-4,-4,8,8],'curvature',[1,1]),'linestyle',':');
    end
end