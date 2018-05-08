fid = fopen('BiCG.txt');
tline = fgetl(fid);
pattern = 'Test'
epoch = 60;
A = zeros(5,epoch); % matrix 5*30
avg = zeros(1,epoch);
i = 1;
idx = 1;
while ischar(tline) %EOF
    
    if (contains(tline,pattern))
        C = strsplit(tline,'Test accuracy:');
        x = cell2mat(C);
        A(i,idx) = str2num(x);
        idx = idx + 1;
    end
    
    if (contains(tline,'OPTIMIZATION') )
       i = i + 1;
       idx = 1;
    end
    
    tline = fgetl(fid);
end
fclose(fid);
avg = mean(A);
plot(avg,'LineWidth',1);
%p = plot(avg,'k','LineWidth',1)
p = plot(avg)
xlim([1 epoch])
xlabel('”½•œ‰ñ”')
ylabel('³“š—¦')
legend([p],'•½‹Ï³“š—¦')