image = input('Nome do ficheiro: ', 's');
I = imread(image);
I = rgb2gray(I);
image_name = split(image, '.');
image_name = image_name{1};
gray_name = strcat(image_name, '_gray.png');
imwrite(I, gray_name);
main_image_recognition(gray_name, 'gaussian', [0, 0]);