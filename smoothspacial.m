function smoothed = smoothspacial(image, smoothing, filter_params)
    switch smoothing
        case "median"
            smoothed = medfilt2(image, filter_params);
        case "gaussian"
            H = fspecial('gaussian', filter_params(1), filter_params(2));
            smoothed = imfilter(image, H);
        case "average"
            H = fspecial('average', filter_params);
            smoothed = imfilter(image, H);
    end
end