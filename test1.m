image = imread('hf_local_2016.png');
imshow(image);
gray = rgb2gray(image);
[nrows,ncols] = size(gray);
vector_string = [];
for i = 1:nrows
    for j = 1:ncols
        if i>=3 && i<= nrows-2 && j>=3 && j<= ncols-2
            pixel(1, 1) = gray(i-2, j-2);
            pixel(1, 2) = gray(i-2, j-1);
            pixel(1, 3) = gray(i-2, j);
            pixel(1, 4) = gray(i-2, j+1);
            pixel(1, 5) = gray(i-2, j+2);
            
            pixel(2, 1) = gray(i-1, j-2);
            pixel(2, 2) = gray(i-1, j-1);
            pixel(2, 3) = gray(i-1, j);
            pixel(2, 4) = gray(i-1, j+1);
            pixel(2, 5) = gray(i-1, j+2);
            
            pixel(3, 1) = gray(i, j-2);
            pixel(3, 2) = gray(i, j-1);
            pixel(3, 3) = gray(i, j);
            pixel(3, 4) = gray(i, j+1);
            pixel(3, 5) = gray(i, j+2);
            
            pixel(4, 1) = gray(i+1, j-2);
            pixel(4, 2) = gray(i+1, j-1);
            pixel(4, 3) = gray(i+1, j);
            pixel(4, 4) = gray(i+1, j+1);
            pixel(4, 5) = gray(i+1, j+2);
            
            pixel(5, 1) = gray(i+2, j-2);
            pixel(5, 2) = gray(i+2, j-1);
            pixel(5, 3) = gray(i+2, j);
            pixel(5, 4) = gray(i+2, j+1);
            pixel(5, 5) = gray(i+2, j+2);
            
            glcm = graycomatrix(pixel,'G',[]);
            stats = graycoprops(glcm);
            vector = [stats.Contrast, stats.Correlation, stats.Energy, stats.Homogeneity];
            vector_string = cat(1,vector_string,vector);
        else
            vector = [0, 0, 0, 0];
            vector_string = cat(1,vector_string,vector);
        end
    end
end

    