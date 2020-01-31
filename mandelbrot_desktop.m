% get an array to span the real-range
row = linspace(-0.748766713922161, -0.748766707771757, 11000);
% array to span imaginary-range
col = linspace(0.123640844894862, 0.123640851045266, 11000);
% I will store the real parts and imaginary parts of c in separate 11000x11000
% arrays. 
[c_re, c_im] = meshgrid(row, col);
% These will be 11000x11000x500-dimensional tensors that will store the
% trajectory for every point in the grid.
re_prev = zeros(11000, 11000);
im_prev = zeros(11000, 11000);
re = zeros(11000, 11000);
im = zeros(11000, 11000);
div = int16(zeros(11000, 11000));
% Find the values of each trajectory and store number of divergences
for i = 2:500
    % Re(z^2) = re^2 -im^2
    re = re_prev.^2 - im_prev.^2;
    % Im(z^2) = 2 * re * im
    im = 2 * re_prev .* im_prev;
    % Add c to each
    re = re + c_re;
    im = im + c_im;
    div = div + int16(((re.^2 + im.^2) >= 4) | div);
    re_prev = re;
    im_prev = im;
end
disp('Tensors built.')
% Loop through all values of c and calculate the k required for divergence
k_mat = int16(zeros(11000, 11000));
k_mat = k_mat + 501 - div;

f2 = figure('Name', 'Mandelbrot set around (-0.748, 0.123)');
imagesc(row, col, k_mat);
axis equal;
axis([-0.748766713922161, -0.748766707771757, 0.123640844894862, 0.123640851045266]);
print(f2,'mandelbrot.png','-dpng','-r2000');