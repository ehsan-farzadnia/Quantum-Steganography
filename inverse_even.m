function [P_Matrix] = inverse_even(k,Dimen)

for j=1:size(Dimen,2)
    for i=1:size(Dimen,1)
        
                X=dec2bin(i-1,log2(size(Dimen,1)));
                Y=dec2bin(j-1,log2(size(Dimen,2)));
                [X]=inverse_bit(X);
                [Y]=inverse_bit(Y);
                
                % Step 1
                
                if Y(k+1)=='1' && X(k+1) == '0'
                    
                    for m=1:k
                       Y(m)=xorbin(Y(m),Y(k+1));
                       X(m)=xorbin(X(m),Y(k+1));
                    end
                        
                end
                
                % step 2
                
              if X(k+1)=='1'
                for m=k:-1:1
                    [Y(m),X(m)]=Swp(X(m),Y(m));
                end
              end
             
              % step 3
              
            if Y(k+1)=='1'
               X(k+1)=xorbin(X(k+1),Y(k+1)); 
            end
 
    
           [X]=inverse_bit(X);
           [Y]=inverse_bit(Y);
              
     
           %%%%%%%%%

     w= bin2dec(Y)+1;
     l= bin2dec(X)+1;
     P_Matrix(w ,l)=Dimen(j ,i);
         
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

