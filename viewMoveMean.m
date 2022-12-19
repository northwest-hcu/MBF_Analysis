

function average_arr=viewMoveMean(dir_name,move_range,xlim_pos,ylim_pos,show_graph,save_fig,scale_x,scale_y,translate_x,translate_y)
    files=dir(strcat(dir_name,'/*.txt')); %ファイル一覧の取得
    channels=getPosition('.',true); %各チャンネルの指定場所のみ座標を取得
    plot_range=0.03*scale_x; %plotの大きさを設定
    addpath(dir_name); %フォルダのアクセス権限許可
    window_name=strsplit(dir_name,'/');
    if length(window_name) == 1
        window_name=strsplit(dir_name,'\');
    end
    window_name=strcat(string(window_name(length(window_name)-1)),':',string(window_name(length(window_name))));
    if show_graph
        % figureの設定
        fig=figure('Name',strcat(window_name,'(各波形)'),'NumberTitle','off');
        ave_fig=figure('Name',strcat(window_name,'(標準偏差)'),'NumberTitle','off');
    end
    
    for i=1:length(files)
        file_name=files(i).name;
        labels{1,i}=file_name; %legend用にファイル名を取得
        file_data=importdata(file_name);
        units=file_data(:,1); % 時間
        file_data=file_data(:,2:width(file_data)); %時間以外のデータ
        data_len=height(file_data); % データの長さ
        channel_len=width(file_data); % チャンネル数
        
        % 空配列定義
        arr=zeros(data_len,channel_len);
        
        % 移動平均
        for j=1:channel_len
            arr(:,j)=movmean(file_data(:,j),move_range);
        end

        % 加算配列連結
        if i==1
            total_arr=arr;
            store_arr=cell(data_len,channel_len); %標準偏差用にセル配列
            for j=1:channel_len
                for k=1:data_len
                    store_arr{k,j}=arr(k,j); %初期代入
                end
            end
        else
            % データ数が変わった時は隙間を0埋めで行列再構成
            if data_len > height(total_arr)
               total_arr=expandRanks(total_arr,data_len,channel_len,0); 
            elseif data_len < height(total_arr)
                arr=expandRanks(arr,height(total_arr),channel_len,0);
            end
            total_arr=total_arr+arr; %加算
            for j=1:channel_len
                for k=1:data_len
                    store_arr{k,j}=horzcat(store_arr{k,j},arr(k,j)); %標準偏差用セル配列に各データを付け加えていく
                end
            end
        end
        if show_graph
            % 各ファイルの図形    
            for j=1:channel_len
                figure(fig); %個々プロットのウインドウを指定
                % 引数に合わせて座標を調整
                pos=[(channels(j,2)*scale_x+0.5)+translate_x-plot_range/2 (channels(j,3)*scale_y+0.5)+translate_y+plot_range/2 plot_range plot_range];
                subplot('Position',pos); %座標指定でプロット
                plot(units,arr(:,j));
                hold on;
                title(strcat('p',num2str(j)));
                xlim(xlim_pos);
                ylim(ylim_pos);
            end
        end
    end
    if show_graph
        legend(labels);
        if save_fig        
            saveas(fig,strcat(dir_name,'/mean.fig'),'fig');
            saveas(fig,strcat(dir_name,'/mean.jpg'),'jpg');
        end
    end

    % 標準偏差
    average_arr=total_arr/length(files);
    std_arr=zeros(channel_len,data_len);
    if show_graph
        for i=1:channel_len
            figure(ave_fig);
            pos=[(channels(i,2)*scale_x+0.5)+translate_x-plot_range/2 (channels(i,3)*scale_y+0.5)+translate_y+plot_range/2 plot_range plot_range];
            subplot('Position',pos);
            for j=1:data_len
                std_arr(i,j)=std(transpose(store_arr{j,i}));
            end
            e=errorbar(units,average_arr(:,i),std_arr(i,:));
            e.Color=[0.75 0.75 0.75];
            e.CapSize=0;
            hold on;
            plot(units,average_arr(:,i),'r');
            title(strcat('p',num2str(i)));
            xlim(xlim_pos);
            ylim(ylim_pos);
        end
        if save_fig
            saveas(ave_fig,strcat(dir_name,'/ave.fig'),'fig');
            saveas(ave_fig,strcat(dir_name,'/ave.jpg'),'jpg');
        end
    end
    
end