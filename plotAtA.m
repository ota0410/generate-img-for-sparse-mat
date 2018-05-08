function plotAtA(filename, scaling)
    Problem = ssget(filename);
    M = Problem.A;
    N = transpose(M);
    %N * MÇÕA^TA
    %M * NÇÕAA^T
    M = N * M;
    %switch on/off
    f = figure('visible','off');
    Mname = Problem.name;
    %set(f,'Position','auto') 
    axes('position', [0 0 1 1],'Box','off');
    %axes('Outerposition',[0 0 0.1 0.1]);
    
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
    pos(3)=width; % Ç»Ç∫Ç©ïùÇ™1pxëùÇ¶ÇÈÇÃÇ≈ëŒèà
    pos(4)=height;

    set(gcf,'Position',pos,'InvertHardcopy','off','Resize','on');
    name = strcat('ATA',name);
    %print(F.cdata,name,'-r0','-djpeg');
    saveas(gcf,name,'jpg');
end