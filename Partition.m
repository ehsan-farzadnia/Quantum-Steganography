    function [new_position]=Partition(k,imCvr)
Dim=size(imCvr);
 
for j =1 : Dim(2)       % array 2 ^ n * 2 ^ n (e.g, 512 * 512) 
    for i=1 : Dim(1)

     % convert to bit format
        
     X=dec2bin(i-1,log2(Dim(1)));
     p=k+1;
     
     %----inverse bit ordering
     
     [IX]=inverse_bit(X);
    
     while p+2<=log2(Dim(1))
         [IX(p+2),IX(p+1)]=Swp(IX(p+1),IX(p+2));
         p=p+1;
     end
  
     p=p-1;
     Y=dec2bin(j-1,log2(Dim(2)));
     [IX(p+2),Y(log2(Dim(2)))]= Swp(Y(log2(Dim(2))),IX(p+2));
     
     %----new positions------
                         
     [X]=inverse_bit(IX);
      
     %%%

     w= bin2dec(Y) +1;
     l=bin2dec(X)+1;
     new_position(w ,l)=imCvr(j,i);
     
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
