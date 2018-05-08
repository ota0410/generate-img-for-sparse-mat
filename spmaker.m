%open the list of matrices and read them
filename = 'symlist.txt';
delimiterIn = '\n';
headerlinesIn = 1000;
A = importdata(filename,delimiterIn,headerlinesIn);

%make sparse matrix with rand()
for k =1:numel(A)
   str = char(A(k,1));
   Problem = ssget(str);
   M = Problem.A;
   %switch sym/Asym
   %R = sprand(M);
   R = sprandsym(M);
   C = strsplit(str,'/');
   out = strcat('02_',C(2));
   out = strcat(out(1,1),'.mtx');
   mmwrite(char(out(1,1)),R,'hoge')
   clearvars R;
   clearvars M;
end;