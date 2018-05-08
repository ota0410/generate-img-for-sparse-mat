fid = fopen('Asym.txt');
tline = fgetl(fid);
fileID = fopen('exp.txt','w')
while ischar(tline)
    Problem=ssget(tline); 
    x = cond( full(Problem.A),2 );
    clear Problem;
    s = strcat(tline,'/',num2str(x));
    fprintf(fileID,"%s\n",s);
    tline = fgetl(fid);
end
fclose(fid);