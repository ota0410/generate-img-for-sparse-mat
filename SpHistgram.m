% adjust argument, 'sym' you want to plot
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
    x = hist(h,256);
    for idx = 2:255
        x(idx-1) = x(idx);
    end
    %�q�X�g�O�����̕��ς���邽��((�x��)*(�K����))���v�Z
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
        
    %�낪�����͓̂�����O�Ȃ̂Œ[�܂���
    xlim([1 255])
    ylim([0 1000])
    xlabel('�F�̔Z�x���z')
    ylabel('�h�b�g�̐�')
    fname = strsplit(D(i).name,'.');
    fname = strcat(fname(1),'hist','.jpg');
    C = char(fname)
    %saveas(gcf,C);
end