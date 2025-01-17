function image_recognition(image)
    I = imread(image);
    I = rgb2gray(I);
    image_name = split(image, '.');
    image_name = image_name{1};
    gray_name = strcat(image_name, '_gray.png');
    imwrite(I, gray_name);
    fprintf("1 -> Salt-and-pepper\n");
    fprintf("2 -> Gaussian\n");
    noiseInput = input('Tipo de ru�do: ');
    if noiseInput == 1
        d = input('Densidade do ru�do (%): ');
        if isempty(d)
            d = 0.05;
        else
            d = d / 100;
        end
        main_image_recognition(gray_name, 'salt & pepper', d);
    elseif noiseInput == 2
        m = input('M�dia do ru�do: ');
        if isempty(m)
           m = 0;
        end
        var = input('Vari�ncia do ru�do: ');
        if isempty(var)
            var = 0.01;
        end
        main_image_recognition(gray_name, 'gaussian', [m, var]);
    else
        error('Comando inv�lido');
    end
end