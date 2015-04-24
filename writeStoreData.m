
clc
clear all
%variables
x=8;
%%
x=x+1; % fix arrays i=1
i=0;
for x1=x: 2^5
 i=i+1 % since arrays start with i=1
guid(i)=x1;

end
guid1=guid-1;
fid=fopen('MyFile.txt','w');

fprintf(fid, '%f \n', guid1');
fclose(fid);