function [x_pos, y_pos] = gsMatrixEval(matrix, gs_x, gs_y, start_x, start_y)
% gsMatrixEval evaluates the passed in matrix to find the local maximum
% frequency, updating the maxFreq, x_pos, and y_pos output parameters
%
% PARAMETERS:
% matrix => gs_x x gs_y sub-matrix of points to be evaluated amongst each other
% gs_x => matrix x-size
% gs_y => matrix y-size
% start_x => starting x value relative to main matrix
% start_y => starting y value relative to main matrix
%
    maxFreq = -1;
    x_pos = -1;
    y_pos = -1;
    for i=1:gs_x % i = current_x_pos
        for j=1:gs_y % j = current y_pos
            currFreq = abs(matrix(i,j));
            if(currFreq > maxFreq)
                maxFreq = currFreq;
                x_pos = i + start_x;
                y_pos = j + start_y;
            end
        end
    end

end
