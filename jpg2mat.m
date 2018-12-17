%%针对图片名为连续标号的Matlab程序
file_path = 'C:\Users\Arlen\Documents\MATLAB\PictoMat\Pose07_64x64_files\';%图片路径可以根据自己需要修改;  
pic = '*jpg';%图片格式，根据自己的图片格式进行修改;  
img_path_list = dir(strcat(file_path,pic));%获取该文件夹中所有jpg格式的信息
fea = [];%特征
gnd = [];%所属类别
num_perClass=24;%每一类包含的图片张数
for i = 1:size(img_path_list,1)
img=imread([file_path,num2str(i),'.jpg']);
im = reshape(img,1,size(img,1)*size(img,2));
fea(i,:) = im;
class = fix(i/num_perClass)+1;%不能整除时，类别数比真实类别差1
if(class)
    gnd(i,1) = class;
    if(~rem(i,num_perClass)) %如果余数为0，则类别直接是商
       gnd(i,1) = i/num_perClass;
    end
end
end
save PIE07_64x64.mat fea gnd
