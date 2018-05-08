D=dir('./*.mtx')
for k=1:length(D)
    openfname = D(k).name;
    fn = load (openfname);
    [name,ext] = fileparts(openfname);
    A = spconvert(fn);
    A(2836,2836)=0.0;
    B = transpose(A);
    A = B*A;
    fig = figure('visible','off');
    cspy(A)
    saveas(fig,ext,'jpg');
end