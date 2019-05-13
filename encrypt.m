function [ share1, share2 ] = encrypt( img, key )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    %pattern = fetch_pattern(key);%share1 = [1357]; share2 = [2468] ---> [0,1,0,1,0,1,0,1] 
    img = imread(img);
    q = rgb2gray(img);

    dim = size(q);
    share1 = uint8(zeros(dim(1).*2));
    share2 = uint8(zeros(dim(2).*2));

    for i= 1:dim(1)
        for j= 1:dim(2)
            i
            j
            pattern = fetch_pattern(key);
            key = mod((key+double(q(i,j))),70);
            temp = uint8(dec2bin(q(i,j),8)-48);
            
            t1 = temp(pattern(1,1:4));
            t2 = temp(pattern(2,1:4));
            t1 = reshape(t1,[2,2])';
            t2 = reshape(t2,[2,2])';
        
            share1((((2*i)-1):(2*i)),(((2*j)-1):(2*j))) = t1;
            share2((((2*i)-1):(2*i)),(((2*j)-1):(2*j))) = t2;
        end
    end
    imwrite(share1,'share_p_1.bmp');
    imwrite(share2,'share_p_2.bmp');
    
    subplot(223);imshow(share1,[0,1]);title('Share1');
    subplot(224);imshow(share2,[0,1]);title('Share2');
end

