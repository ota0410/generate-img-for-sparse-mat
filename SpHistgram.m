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
        %�q�X�g�O�����p�Ɉꎟ���ɂ���
        h = zeros(1, sz*sz);
        for j = 1:sz
            for k = 1:sz
                h(sz*(j-1)+k) = M(j,k);
            end
        end
        % 256�K�F�Ȃ̂�
        hist(h,256);
        %�낪�����͓̂�����O�Ȃ̂Œ[�܂���
        xlim([1 255])
        ylim([0 6272])
        xlabel('�F�̔Z�x���z')
        ylabel('�h�b�g�̐�')
        fname = strsplit(D(i).name,'.');
        fname = strcat(fname(1),'hist','.jpg');
        C = char(fname)
        saveas(gcf,C);
    end
end