function [ret] = fetch_pattern( key )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    buf = ' ';
    [status, pattern] = system(['python permutation.py ',buf,int2str(key)]);%,int2str(key)));
    
    x = size(pattern);
    s1 = -1;
    s2 = -1;
    for i= 1:x(2)
        if pattern(i) == '0'
            s1 = [s1,i];
        else
            s2 = [s2,i];
        end
    end
    s1 = s1([2:end]);
    s2 = s2([2:end]);
    pattern = uint8(pattern)-48;
    
    ret = [s1 0 0 0 0;s2 0 0 0 0; pattern];
    
end

