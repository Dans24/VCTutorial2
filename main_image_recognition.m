function [segmented_image, segmented_image_noise, SNR, original_image, histogram, number] = main_image_recognition(gray_img_filename, noise_type, noise_params)
    % Load Image
    original_image = imread(gray_img_filename);
    % Introduce Noise
    noise_img = noise_gen(original_image, noise_type, noise_params);
    SNR = [];
    % Process Image
    % filtering methods, contrast equalization, normalization, among other techniques
    
    % segmenting all of the coins in the image
    
    segmented_image = [];
    segmented_image_noise = [];
    % final segmentation result
    
    % count number of coins
    
    number = 0;
    % histogram showing the distribution of object sizes
    histogram = [];
end

