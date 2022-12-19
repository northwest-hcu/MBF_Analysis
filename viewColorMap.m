
function viewColorMap(dir_name,interval,xlim_pos,ylim_pos,save_gif,x_start,x_end,clevel,effective,markerNum)
    %各チャネルのデータを取得
    values=viewMoveMean(dir_name,20,xlim_pos,ylim_pos,false,false,0,0,0,0);
    values_len=height(values);
    x_start_offset=x_start-xlim_pos(1);
    window_name=strsplit(dir_name,'/');
    if length(window_name) == 1
        window_name=strsplit(dir_name,'\');
    end
    window_name=strcat(string(window_name(length(window_name)-1)),':',string(window_name(length(window_name))));
    if x_start < 1
        x_label=x_start;
        x_start=1;
        x_end=x_end-(x_label-1);
    end
    x_start=x_start+x_start_offset;
    x_end=x_end+x_start_offset;
    if x_start > values_len || x_end > values_len
        disp(strcat('[x_start]:',num2str(x_start),' and [x_end]:',num2str(x_end),' arguments must be values length or less than it.'));
        return;
    elseif x_end <= x_start
        disp('[x_end] argument must be over than [x_start] argument.' )
        return;
    end
    data_channels=getPosition('.',true);
    all_channels=getPosition('.',false);
    file_name='result.gif';
    im=cell(height(values));
    if effective
        values_matrix=zeros(values_len,length(data_channels));
    else
        values_matrix=zeros(values_len,length(all_channels));
    end
    for i=1:length(data_channels)
        if effective
            values_matrix(:,data_channels(i,4))=values(:,i);
        else
            values_matrix(:,data_channels(i,1))=values(:,i);
        end
    end
    if strcmp(clevel,'high')
        [Xq,Yq]=meshgrid(-0.5:0.0002:0.5,-0.5:0.0002:0.5);
    elseif strcmp(clevel,'normal')
       [Xq,Yq]=meshgrid(-0.5:0.0005:0.5,-0.5:0.0005:0.5);
    elseif strcmp(clevel,'low')
        [Xq,Yq]=meshgrid(-0.5:0.001:0.5,-0.5:0.001:0.5);
    end    

    % 時間経過の閲覧
    graphCount = fix((x_end-x_start)/interval); %グラフデータ数
    if rem(x_end-x_start,interval) > 0
        graphCount=graphCount+1;
    end
    line = fix(graphCount/5); %プロット行数
    if rem(graphCount,5) > 0
        line=line+1;
    end
    index=0; %グラフインデックス
    tim_fig=figure('Name',window_name,'NumberTitle','off');
    if save_gif
        gif_fig=figure('Name',strcat('gif:',window_name),'NumberTitle','off');
    end
    for i =x_start:interval:x_end
        title_str=strcat(num2str(x_label),' ms');
        figure(tim_fig);
        colormap('jet');
        %disp(i);
        index=index+1;
        if graphCount < 5
            subplot(1,graphCount,index);
        else
            subplot(line,5,index);
        end
        if effective
            Vq=griddata(data_channels(:,2),data_channels(:,3),values_matrix(i,:),Xq,Yq);
        else
            Vq=griddata(all_channels(:,2),all_channels(:,3),values_matrix(i,:),Xq,Yq);
        end
        [~,c]=contourf(Xq,Yq,Vq);
        set(c, 'edgecolor','none');
        c.LineColor='none';
        caxis(ylim_pos);
        title(title_str);
        ax=gca;
        ax.XTickLabel = cell(size(ax.XTickLabel));
        ax.YTickLabel = cell(size(ax.YTickLabel));
        if markerNum
            hold on;
            plot(data_channels(:,2),data_channels(:,3),'.','MarkerSize',5,'Color',[0 0 0]);
            for n=1:height(data_channels)
                text(data_channels(n,2),data_channels(n,3),string(data_channels(n,4)));
            end
        end
        if save_gif
            figure(gif_fig);
            colormap('jet');
            [~,c]=contourf(Xq,Yq,Vq);
            set(c, 'edgecolor','none');
            c.LineColor='none';
            caxis(ylim_pos);
            title(title_str);
            ax=gca;
            ax.XTickLabel = cell(size(ax.XTickLabel));
            ax.YTickLabel = cell(size(ax.YTickLabel));
            if markerNum
                hold on;
                plot(data_channels(:,2),data_channels(:,3),'.','MarkerSize',5,'Color',[0 0 0]);
                for n=1:height(data_channels)
                    text(data_channels(n,2),data_channels(n,3),string(data_channels(n,4)));
                end
            end
            colorbar('southoutside');
            frame=getframe(gif_fig);
            im{index}=frame2im(frame);
        end
        x_label=x_label+interval;
    end
    figure(tim_fig);
    c=colorbar('southoutside');
    c.Position(1:4)=[0.1,0.06,0.8,0.01];

    savefig(tim_fig,strcat(dir_name,'/time_process.fig'));
    % gifの保存
    if save_gif
        for i=1:index
            [A,map]=rgb2ind(im{i},256);
            if i == 1
                imwrite(A,map,strcat(dir_name,'/',file_name),'gif','LoopCount',Inf,'DelayTime',0.5);
            else
                imwrite(A,map,strcat(dir_name,'/',file_name),'gif','WriteMode','append','DelayTime',0.5);
            end
        end
    end

end