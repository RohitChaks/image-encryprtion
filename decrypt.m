function [ orig ] = decrypt( share1,share2,key )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    s1 = uint8(imread(share1));
    s2 = uint8(imread(share2));
    dim = size(s1);
    %pattern = fetch_pattern(key);
    %pattern = pattern(3,:);
    %d = size(pattern);
    d = [1 8];
    for i= 1:2:dim(1)
        for j= 1:2:dim(2)
            i
            j
            pattern = fetch_pattern(key);
            pattern = pattern(3,:);
            %d = size(pattern);
            
            %s1((i:i+1),(j:j+1))
            %s2((i:i+1),(j:j+1))
            st1 = uint8(reshape(s1((i:i+1),(j:j+1))',[1,4]));
            st2 = uint8(reshape(s2((i:i+1),(j:j+1))',[1,4]));
            temp = '#';
            for ii= 1:(d(2))
                if pattern(ii) == 0
                    temp = [temp,int2str(st1(1))];
                    st1 = st1(2:end);
                else
                    temp = [temp,int2str(st2(1))];
                    st2 = st2(2:end);
                end
            end
            temp = bin2dec(temp(2:end));
            orig((floor(i/2)+1),(floor(j/2)+1))=uint8(temp);
            
            key = mod((key+temp),70);
        end
    end
    imwrite(orig,'decrypt.jpg');     
    
    subplot(222);imshow(orig);title('Decrypted Message');
end

