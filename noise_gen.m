function noisy = noise_gen(image, noise_type, noise_params)
    switch noise_type
        case "salt & pepper"
            noisy = imnoise(image, noise_type, noise_params);
        case "gaussian"
            noisy = imnoise(image, noise_type, noise_params(1), noise_params(2));
    end
end