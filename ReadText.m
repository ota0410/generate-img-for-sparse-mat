%open the list of matrices and read them
%check the pattern of matrix
filename = './txt/CGdivATA.txt';
delimiterIn = '\n';
headerlinesIn = 1000;
A = importdata(filename,delimiterIn,headerlinesIn);

%plot the graphs
for k = 1:headerlinesIn,
   str = char(A(k,1));
   plotAtA(str,1)
%  plotAAt(str,1)
%  plotA(str,1)
end;
[y,Fs] = audioread('UC.mp3');
sound(y,Fs);
%load handel.mat; sound(y,Fs);