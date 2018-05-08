D=dir('*.mtx')
for k=1:length(D)
    A = mmread(D(k).name)
    mname = strcat('2_',D(k).name)
    mmwrite(mname,A,'hoge','')
end