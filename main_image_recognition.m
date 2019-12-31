function [segmented_image, segmented_image_noise, SNR, original_image, histogram, number] = main_image_recognition(gray_img_filename, noise_type, noise_params)
    % Load Image
    original_image = im2double(imread(gray_img_filename));
    % Introduce Noise
    noise_img = noise_gen(original_image, noise_type, noise_params);
    SNR = 10 * log10(var(original_image(:)) / var(noise_img(:)));
    fprintf('SNR da imagem com ruído: %f dB\n', SNR);
    % Process Image
    % filtering methods, contrast equalization, normalization, among other techniques
    if strcmp(noise_type, 'salt & pepper')
        I = smoothspacial(noise_img, 'median', [3 3]);
    else
        I = smoothspacial(noise_img, 'gaussian', [3, noise_params(2)]);
    end
    figure;
    imshow(I);
    n = 1;
    coinRadii = input('Raio da moeda (px): '); % 200 425 500
    % 200 425 500
    sensitivity = input('Sensibilidade (%): ') / 100; % 0.92 0.925 0.925
    % 0.96 ? 0.96
    canny_threshold = [input('Canny threshold menor (%): ')/100 input('Canny threshold maior (%): ')/100]; %[0.05 0.4] [0.1 0.3] [0.05 0.4]
    % [0.1 0.4] ? [0.1 0.4]
    while size(I) > coinRadii * 2
        I = impyramid(I, 'reduce');
        n = n * 2;
    end
    %imshow(I);
    %figure;
    % Smooth
    %E = smoothspacial(noise_img, "gaussian", [3 0.25]);
    %imshow(E);
    %figure;
    % Histogram Equalization / Normalization
    if strcmp(input('Remover sombra (y/n): ', 's'), 'y')
        I = imtophat(I, strel('disk', input('Tamanho do filtro (px): ' )));
        I = adapthisteq(I);
    end
    %I= histeq(I);
    %I= imadjust(E);
    imshow(I);
    figure;
    % Threshold
    %T = adaptthresh(E,0.5,'ForegroundPolarity','dark');
    %I= imbinarize(E,T);
    %imshow(E);
    %figure;
    %imshow(M);
    %figure;
    % Edge detection
    I = edge(I, 'canny', canny_threshold);
    imshow(I);
    figure;
    RRange = [50 150];
    [centers, radii] = imfindcircles(I, RRange, 'Sensitivity', sensitivity);
    centers = centers * n;
    radii = radii * n;
    imshow(original_image);
    viscircles(centers, radii, 'EdgeColor', 'b');
    figure;
    imshow(noise_img);
    viscircles(centers, radii, 'EdgeColor', 'b');
    
    % segmenting all of the coins in the image
    
    segmented_image = [];
    segmented_image_noise = [];
    % final segmentation result
    
    % count number of coins
    
    number = size(centers);
    % histogram showing the distribution of object sizes
    histogram = [];
end

