D = dir('./*.jpg')
mean = zeros(1, length(D));
var  = zeros(1, length(D));
fileID = fopen('myfile.txt','w');
for i = 1:length(D)
    str = ''
    RGB  = imread(D(i).name);
    M = imresize(RGB, [112,112]);
    sz = size(M,1);
    M = M(:,:,1);

    %ヒストグラム用に一次元にする
    h = zeros(1, sz*sz);
    for j = 1:sz
        for k = 1:sz
            h(sz*(j-1)+k) = M(j,k);
        end
    end

    % 256階色なので
    hist(h,256);
    x = hist(h,256);
    for idx = 2:256
        x(idx-1) = x(idx);
    end
    
    %ヒストグラムの平均を作るため((度数)*(階級数))を計算
    tmp = 0;
    for idx = 1:255
        tmp = tmp + x(idx) * idx;
    end
    %display the mean
    mean(i) = tmp / sum(x);
    
    %calculate the varience & stdev
    tmp = 0;
    for idx = 1:255
        tmp = tmp + (idx - mean(i)) * (idx - mean(i)) * x(idx);
    end
    var(i) = tmp / sum(x);
    %stdev = sqrt(var)
    
    %零が多いのは当たり前なので端折った
    xlim([1 255])
    ylim([0 1000])
    xlabel('色の濃度分布')
    ylabel('ドットの数')
    fname = strsplit(D(i).name,'.');
    outname = fname;
    fname = strcat('Histo',fname(1),'.jpg');
    C = char(fname);

    %add annotation to the graph
    dim = [.72 .6 .3 .3];
    str1 = strcat('var=', num2str(var(i)));
    str2 = strcat('mean=', num2str(mean(i)));
    str = [string(str1), string(str2)];
    Newstr = strjoin(str,'\n')
    %disp(Newstr)
    htemp = annotation('textbox',dim,'String',Newstr,'FitBoxToText','on');

    %outpput the numerical data
    fprintf(fileID, '%s %f %f\n',C ,mean(i),var(i));
    
    %save the graph
    %saveas(gcf,C);

    %delete the annotation not to overlap past annotation
    delete(htemp.Parent.Children);
end
fclose(fileID);