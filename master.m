q = input('File Name: ');
key = input('Key Value: ');

subplot(221);imshow(q);title('Original Message');

encrypt(q,key);

share1 = input('Share1 File Name: ');
share2 = input('Share2 File Name: ');

s1 = uint8(imread(share1));
s2 = uint8(imread(share2));

orig = decrypt(share1,share2,key);
