function [new_inverse_position]= inv_partition(k,stego)

    for j=1 : size(stego,2)
        for i=1:size(stego,1)
        
          % YX is cell coordination
           % convert to bit format ... 
           X=inverse_bit(dec2bin(i-1,log2(size(stego,1))));
           Y =inverse_bit(dec2bin(j-1,log2(size(stego,2)))); 
           [Y(k+1),X(log2(size(stego,1)))]=Swp(X(log2(size(stego,1))),Y(k+1));
            ed=log2(size(stego,1));
           while  ed > k+2
                [X(ed),X(ed-1)]= Swp(X(ed-1),X(ed));
                ed=ed-1;
           end
             
            X=inverse_bit(X);
            Y=inverse_bit(Y); 
            %%%
            w=bin2dec(Y)+1;
            l=bin2dec(X)+1;
           
            new_inverse_position(w,l)=stego(j,i);
            
        end
    end

end

function [output]=inverse_bit(input)
   m=length(input);
    output=dec2bin(0,m);
     for n=1 : m      
         output(n)= input(m);
         m=m-1;
     end

end

function [B,A]=Swp(A,B)
    
    t=A;
    A=B;
    B=t;

end
