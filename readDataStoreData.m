 clc
 clear all
fid=fopen('MyFile.txt');
i=0;
nbits=5;
d=0;
e=[];
%for i= 0:(2^nbits)-1 -8
while ~feof(fid)

    i=i+1;
     tline = fgetl(fid);
    d(i)=str2double(tline);
    e(:,:,i)=fliplr(de2bi(d(i),5));
   
end

setappdata(0,'k',e);
fclose(fid);