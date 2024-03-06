%----------Dividing---------------------
%
%
%
function [msg_position]=Dvd_Cmpr(scrambeled_stego_position,a)
        
        for n=1:(2^((log2(size(scrambeled_stego_position,2)))-a-1))
            for m=1:(2^((log2(size(scrambeled_stego_position,1)))-a-1))
                   
%-------------Dividing--------Countering----------

%  ................ inter coordinations (within each block)... 
sm_cnt=0;

                   for j=((n-1)*(2^((a)+1)))+1:(((n-1)*(2^((a)+1)))+(2^((a)+1)))
                         for i=((m-1)*(2^((a)+1)))+1:(((m-1)*(2^((a)+1)))+(2^((a)+1)))
                             
                            % sum LSB of each pixel
                            num=inverse_bit(dec2bin(scrambeled_stego_position(j,i),8));   % to binary ... 
                            sm_cnt = sm_cnt + bin2dec(num(1));   % counting the LSB numbers of all pixels in the block ... 

%----------------Comparing------------------------
                            
                            
                        end
                   end
            
                            if sm_cnt >= (2^a)                         % Threshold value
                                
                                msg_position(n,m) = 1;   % get null bit 1 (white pixel) ... 
                            elseif sm_cnt <= (2^a)-1         
                                
                                msg_position(n,m) = 0;   % get message bit 0 (black pixel) ... 
                            end
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