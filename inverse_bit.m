function [output]=inverse_bit(input)
   m=length(input);
    output=dec2bin(0,m);
     for n=1 : m      
         output(n)= input(m);
         m=m-1;
     end

end