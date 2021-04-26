clc;clear;
% you can change the path
addpath('.\007\');
path = '.\007\';
savePath = '.\result\';
filename = dir(path);
filelen = length(filename);
names = {};
output = {};
k = 0;
for i = 1:filelen-2  % dataset
    subPath = [path,filename(i+2).name,'\'];
    if isdir(subPath)
        fn = dir(subPath);
        fnlen = length(fn);

            for j = 1:fnlen-2  % prdiction case 
                pic = [];
                temp = [];
                k = k+1;
                temp = fn(j+2).name;
                names{k} = temp;
                pic = imread([subPath, temp]);
                output{k} = pic;
            end 
    end
end
save result.mat output names

disp('done !')


