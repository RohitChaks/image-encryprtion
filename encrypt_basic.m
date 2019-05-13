%pattern = [0,1,0,1,0,1,0,1];  % ---> share1 = [1357]; share2 = [2468]
q = rgb2gray(imread('3.jpg'));

dim = size(q);
share1 = uint8(zeros(dim(1).*2));
share2 = uint8(zeros(dim(2).*2));

for i= 1:dim(1)
    for j= 1:dim(2)
        temp = uint8(dec2bin(q(i,j),8)-48);
        
        t1 = temp([1 3 5 7]);
        t2 = temp([2 4 6 8]);
        t1 = reshape(t1,[2,2])';
        t2 = reshape(t2,[2,2])';
        
        share1((((2*i)-1):(2*i)),(((2*j)-1):(2*j))) = t1;
        share2((((2*i)-1):(2*i)),(((2*j)-1):(2*j))) = t2;
    end
end
imwrite(share1,'share1.bmp');
imwrite(share2,'share2.bmp');

