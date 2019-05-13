%pattern = [0,1,0,1,0,1,0,1];  % ---> share1 = [1357]; share2 = [2468]
share1 = uint8(imread('share1.bmp'));
share2 = uint8(imread('share2.bmp'));

dim = size(share1);
orig = uint8(zeros(dim(1)/2));

for i= 1:2:dim(1)
    for j= 1:2:dim(2)
        s1 = share1((i:i+1),(j:j+1));
        s2 = share2((i:i+1),(j:j+1));
        temp = '#';
        for ii = 1:2
            for jj = 1:2
                temp = strcat(temp,dec2bin(s1(ii,jj)),dec2bin(s2(ii,jj)));
            end
        end
        temp = uint8(bin2dec(temp(2:end)));
        orig((floor(i/2)+1),(floor(j/2)+1))=temp;
    end
end

subplot(221);imshow(q);title('Original Message');
subplot(222);imshow(orig);title('Decrypted Message');
subplot(223);imshow(share1,[0,1]);title('Share1');
subplot(224);imshow(share2,[0,1]);title('Share2');
                