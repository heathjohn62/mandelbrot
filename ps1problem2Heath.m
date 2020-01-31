% ACM 95a Problem Set 1
% Problem 2 Parts B and C
% Section 9
% John Heath

% get an array to span the real-range
row = linspace(-2, 1, 1000);
% array to span imaginary-range
col = linspace(-1.5, 1.5, 1000);
% I will store the real parts and imaginary parts of c in separate 1000x1000
% arrays. 
[c_re, c_im] = meshgrid(row, col);
% These will be 1000x1000x500-dimensional tensors that will store the
% trajectory for every point in the grid.
re = zeros(1000, 1000);
im = zeros(1000, 1000);
% Find the values of each trajectory
for i = 2:500
    % Re(z^2) = re^2 -im^2
    re(:, :, i) = re(:, :, i-1).^2 - im(:, :, i-1).^2;
    % Im(z^2) = 2 * re * im
    im(:, :, i) = 2 * re(:, :, i-1) .* im(:, :, i-1);
    % Add c to each
    re(:, :, i) = re(:, :, i) + c_re;
    im(:, :, i) = im(:, :, i) + c_im;
end
% Loop through all values of c and calculate the k required for divergence
k_mat = zeros(1000, 1000);
for x = 1:1000
    for y = 1:1000
        traj_re = re(x, y, :);
        traj_im = im(x, y, :);
        for k = 1:500
            % If the magnitude is greater than 2, store the k and move to
            % the next point. 
            if traj_re(k)^2 + traj_im(k)^2 >= 4
                k_mat(x, y) = k;
                break
            end
        end
        % If the point never 'escaped' then set it equal to N + 1 = 501
        if k_mat(x, y) == 0
            k_mat(x, y) = 501;
        end
    end
end

f1 = figure('Name', 'Mandelbrot set on [-2, 1] x [-1.5, 1.5]');
imagesc(row, col, k_mat);
axis equal;
axis([-2, 1, -1.5, 1.5]);

% I only wanted to use one file and not bother with functions, so I copied
% and pasted the above code below, and simply changed the range. Sorry for
% the repetitive code.

% get an array to span the real-range
row = linspace(-0.748766713922161, -0.748766707771757, 1000);
% array to span imaginary-range
col = linspace(0.123640844894862, 0.123640851045266, 1000);
% I will store the real parts and imaginary parts of c in separate 1000x1000
% arrays. 
[c_re, c_im] = meshgrid(row, col);
% These will be 1000x1000x500-dimensional tensors that will store the
% trajectory for every point in the grid.
re = zeros(1000, 1000);
im = zeros(1000, 1000);
% Find the values of each trajectory
for i = 2:500
    % Re(z^2) = re^2 -im^2
    re(:, :, i) = re(:, :, i-1).^2 - im(:, :, i-1).^2;
    % Im(z^2) = 2 * re * im
    im(:, :, i) = 2 * re(:, :, i-1) .* im(:, :, i-1);
    % Add c to each
    re(:, :, i) = re(:, :, i) + c_re;
    im(:, :, i) = im(:, :, i) + c_im;
end
% Loop through all values of c and calculate the k required for divergence
k_mat = zeros(1000, 1000);
for x = 1:1000
    for y = 1:1000
        traj_re = re(x, y, :);
        traj_im = im(x, y, :);
        for k = 1:500
            % If the magnitude is greater than 2, store the k and move to
            % the next point. 
            if traj_re(k)^2 + traj_im(k)^2 >= 4
                k_mat(x, y) = k;
                break
            end
        end
        % If the point never 'escaped' then set it equal to N + 1 = 501
        if k_mat(x, y) == 0
            k_mat(x, y) = 501;
        end
    end
end

f2 = figure('Name', 'Mandelbrot set around (-0.748, 0.123)');
imagesc(row, col, k_mat);
axis equal;
axis([-0.748766713922161, -0.748766707771757, 0.123640844894862, 0.123640851045266]);