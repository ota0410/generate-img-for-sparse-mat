%D=dir('C:\Users\xyz_c\Downloads\SuiteSpare\CSparse\MATLAB\CSparse\*.m');
D=dir('./*.jpg')
for k=1:length(D)
    RGB=imread(D(k).name);
    M=RGB(:,:,1);
    %ここのネストはお試し実験
    for i=1:size(M)
        for j=1:size(M)
            M(i,j) = 255 - M(i,j);
        end
    end
    imwrite(M,D(k).name);
%    disp(D(k).name);
end