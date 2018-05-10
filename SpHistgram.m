% adjust argument, 'sym' you want to plot
D=dir('./*.jpg')
for i=1:length(D)     
    RGB = imread(D(i).name);
    M = imresize(RGB, [112,112]);
    sz = size(M,1);
    M = M(:,:,1);
    %disp(M)
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
    for idx = 2:255
        x(idx-1) = x(idx);
    end
    %ヒストグラムの平均を作るため((度数)*(階級数))を計算
    tmp = 0;
    for idx = 1:255
        tmp = tmp + x(idx)*idx;
    end        
    %display the mean
    mean = tmp / sum(x)
    %calculate the varience & stdev
    tmp = 0;
    for idx = 1:255
        tmp = tmp + (idx - mean) * (idx - mean) * x(idx);
    end
    var = tmp / sum(x)
    stdev = sqrt(var)
        
    %零が多いのは当たり前なので端折った
    xlim([1 255])
    ylim([0 1000])
    xlabel('色の濃度分布')
    ylabel('ドットの数')
    fname = strsplit(D(i).name,'.');
    fname = strcat(fname(1),'hist','.jpg');
    C = char(fname)
    %saveas(gcf,C);
end