function [depth] = stereoDisparity()
    left = imread('syn1.png');
    right = imread('syn2.png');

    leftI = mean(left, 3);
    rightI = mean(right, 3);
    depth = zeros(size(leftI), 'single');

    disparityRange = 50;
    halfBlockSize = 3;
    blockSize = 2 * halfBlockSize + 1;
    [h, w] = size(leftI);

    for m = 1 : h

        minr = max(1, m - halfBlockSize);
        maxr = min(h, m + halfBlockSize);

        for n = 1 : w

            minc = max(1, n - halfBlockSize);
            maxc = min(w, n + halfBlockSize);


            mind = 0; 
            maxd = min(disparityRange, w - maxc);

            template = rightI(minr:maxr, minc:maxc);

            numBlocks = maxd - mind + 1;

            blockDiffs = zeros(numBlocks, 1);

            for i = mind : maxd

                block = leftI(minr:maxr, (minc + i):(maxc + i));

                blockIndex = i - mind + 1;

                blockDiffs(blockIndex, 1) = sum(sum(abs(template - block)));
            end

            [temp, sortedIndeces] = sort(blockDiffs);

            bestMatchIndex = sortedIndeces(1, 1);

            d = bestMatchIndex + mind - 1;

            if ((bestMatchIndex == 1) || (bestMatchIndex == numBlocks))
                depth(m, n) = d;
            else
                C1 = blockDiffs(bestMatchIndex - 1);
                C2 = blockDiffs(bestMatchIndex);
                C3 = blockDiffs(bestMatchIndex + 1);

                depth(m, n) = d - (0.5 * (C3 - C1) / (C1 - (2*C2) + C3));
            end
        end

        if (mod(m, 10) == 0)
            fprintf('  Image row %d / %d (%.0f%%)\n', m, h, (m / h) * 100);
        end

    end


    figure(1);

    clf;
    imshow(depth, []);
    axis image;
end

% saveas(gcf,['depth.png']);

