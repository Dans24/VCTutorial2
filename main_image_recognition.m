function [segmented_image, segmented_image_noise, SNR, original_image, histogram, number] = main_image_recognition(gray_img_filename, noise_type, noise_params)
    % Load Image
    original_image = im2double(imread(gray_img_filename));
    % Introduce Noise
    noise_img = noise_gen(original_image, noise_type, noise_params);
    imshow(noise_img);
    figure;
    imshow(original_image);
    figure;
    SNR = 10 * log10(var(original_image(:)) / var(noise_img(:)));
    % Process Image
    % filtering methods, contrast equalization, normalization, among other techniques
    smoothed = smoothspacial(noise_img, "gaussian", [3 0.25]);
    eq = histeq(smoothed);
    imshow(eq);
    figure;
    imhist(eq);
    t = graythresh(eq);
    M = imbinarize(eq, t);
    imshow(original_image);
    [centers, radii] = imfindcircles(original_image, [40 120]);
    viscircles(centers, radii,'EdgeColor','b');
    
    % segmenting all of the coins in the image
    
    segmented_image = [];
    segmented_image_noise = [];
    % final segmentation result
    
    % count number of coins
    
    number = 0;
    % histogram showing the distribution of object sizes
    histogram = [];
end

