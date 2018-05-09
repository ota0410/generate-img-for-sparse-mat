function SpHisgram(filename, sym)
    % filename = MatrixName
    % adjust argument, 'sym' you want to plot
    %{
    if sym == 0
        plotA(filename);
    elseif sym == 1
        plotAAt(filename);
    else
        plotAtA(filename);
    end
    %}
    
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
        %零が多いのは当たり前なので端折った
        xlim([1 255])
        ylim([0 6272])
        xlabel('色の濃度分布')
        ylabel('ドットの数')
        fname = strsplit(D(i).name,'.');
        fname = strcat(fname(1),'hist','.jpg');
        C = char(fname)
        saveas(gcf,C);
    end
end