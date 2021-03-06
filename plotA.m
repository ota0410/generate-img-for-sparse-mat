function plotA(filename,scaling)
    Problem = ssget(filename);
    M = Problem.A;
    %N = transpose(M);
    %N * MはA^TA
    %M * NはAA^T
    %M = N * M;
    %switch on/off
    f = figure('visible','off');
    Mname = Problem.name;
    %set(f,'Position','auto') 
    axes('position', [0 0 1 1],'Box','off');
    %axes('Outerposition',[0 0 0.1 0.1]);
    
    %update 20180508
    if scaling == 1
        M = scaling2(M);
    end
    
    cspy(M);
    [filepath,name] = fileparts(Mname);
    %insert
    width  = 224;
    height = 224;
    %axis square
    %set(gcf,'PositionMode','auto','InvertHardcopy','off')
    pos=get(gcf,'Position');
    pos(3)=width; % なぜか幅が1px増えるので対処
    pos(4)=height;

    set(gcf,'Position',pos,'InvertHardcopy','off','Resize','on');
    name = strcat('A',name);
    %print(F.cdata,name,'-r0','-djpeg');
    saveas(gcf,name,'jpg');
end